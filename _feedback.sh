#!/bin/bash

# usage: docker exec -it portfolio ./home/oski/_feedback.sh
# Don't run this from Rstudio Server. Run it from the terminal where you launched the container

cd /home/oski/feedback/ || {
  su -c "mkdir /home/oski/feedback/" oski
  chmod -R u=rxw /home/oski/feedback/
  cd /home/oski/feedback/
  echo "So we made it ;o"
}
if [ $? -eq 1 ]; then
  echo "This script is intended For use inside w201rdada/portfolio container in /home/oski/feedback directory."
  exit 0
fi
echo "Feedback repositories will be downloaded to /home/oski/feedback/"
echo
echo "Enter the GitHub username of the person to whom you want to provide feedback."
echo -n "Their username: "
read tGHU
echo
echo "Enter your name and an email associated with your GitHub.com account, to authenticate access to private repositories and so they know who provided feedback."
read -p "My first and last name: " mN
read -p "My email: " mE
echo
git config --global --unset-all user.name
git config --global user.name "$mN"
git config --global user.email "$mE"

BRANCH=$(echo "$mN" | sed "s|^\([^ ]*\).*|feedback_\1_$(date +%F)|")
git clone --depth 1 --no-checkout https://github.com/w201rdada/portfolio-$tGHU || true

cd portfolio-$tGHU
git pull
git checkout -b $BRANCH || git checkout $BRANCH
chown oski . *
#chmod u=rxw . *

echo
echo "Now you're on a new branch. You can leave feedback by directly editing text files. You can make any changes you want without worrying about messing up the originals. Use html comments <!-- I'm a comment --> in Rmd files so they won't accidentally be rendered."
echo
echo "When you are finished commenting, type PUSH to commit changes to all modified files, push them to the remote, and make a pull request for the author to review. You will be prompted to enter a message for your pull commit. "
echo "If you don't want to PUSH, type EXIT to stop this script, and manually commit and issue the pull request. You will still be checked out on the feedback branch and can continue working until you're ready."
while true; do
  read -p "PUSH or EXIT: " response
  case $response in
    [Pp][Uu][Ss][Hh] ) break;;
    [Ee][Xx][Ii][Tt] ) exit;;
    * ) echo "Please answer PUSH or EXIT.";;
  esac
done

git pull
git add $(git status --porcelain | grep '^ M' | cut -c4-)
git commit -m"Feedback from $mN."
git push origin $BRANCH
hub pull-request
#-m"Feedback from $mN."
