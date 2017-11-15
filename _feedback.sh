#!/bin/bash

# usage: docker exec -it portfolio ./home/rstudio/_feedback.sh
# Don't run this from Rstudio Server. Run it from the terminal where you launched the container
cd /home/rstudio/feedback/ || {
  su -c "mkdir /home/rstudio/feedback/" rstudio
  chmod -R u=rxw /home/rstudio/feedback/
  cd /home/rstudio/feedback/
  echo "So we made it ;o"
}
if [ $? -eq 1 ]; then
  echo "This script is intended For use inside w201rdada/portfolio container in /home/rstudio/feedback directory."
  exit 0
fi

echo "Feedback repositories will be downloaded to /home/rstudio/feedback/"
echo "
Enter the GitHub username of the person to whom you want to provide feedback."
echo -n "Their username: "
read tGHU
git clone --depth 1 --no-checkout https://github.com/w201rdada/portfolio-$tGHU || true
cd portfolio-$tGHU
echo
git log -1
echo "
Is the last commit date close enough to the due date for this assignment?
Or, does the commit message indicate the correct submission?
If the commit is old they may not yet have submitted.

Type YES (y) if so, or NO (n) to exit the script.
"
while true; do
  read -p "Y or N: " response
  case $response in
    [Yy] ) break;;
    [Nn] ) exit;;
    * ) echo "Please answer Y or N.";;
  esac
done
git checkout master
echo "
Pulling most recent changes to master. You may be prompted for your GitHub
credentials again."
git pull
while [ $? -ne 0 ]; do
    echo "Did you enter your github credentials correctly? If you did, you may not have
repository permissions."
    git pull
done
echo "
Enter your name and an email associated with your GitHub.com account, to
authenticate access to private repositories and so they know who provided
feedback."
read -p "My first and last name: " mN
read -p "My email: " mE
echo
git config --global --unset-all user.name
git config --global user.name "$mN"
git config --global user.email "$mE"

BRANCH=$(echo "$mN" | sed "s|^\([^ ]*\).*|feedback_\1_$(date +%F)|")
git checkout -b $BRANCH || git checkout $BRANCH
chown rstudio . *
#chmod u=rxw . *

echo "
Now you're on a new branch. You can leave feedback by directly editing text
files. You can make any changes you want without worrying about messing up the
originals. Use html comments <!-- I'm a comment --> in Rmd files so they won't
accidentally be rendered. You may prefer to leave comments on GitHub.com after
pushing your commit.

When you are finished editing, type PUSH to commit changes to all modified
files and push them to the remote.

If you don't want to PUSH, type EXIT to stop this script, and manually commit
and push issue the pull request. You will still be checked out on the feedback
branch and can continue working until you're ready.

If the file was flawless or you made no edits, you can EXIT and offer feedback
directly to a relevant commit on the user's remote master branch at:

https://github.com/w201rdada/portfolio-$tGHU/commit/
"

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
echo "Your commit is now viewable on the remote at:

https://github.com/w201rdada/portfolio-$tGHU/commit/$BRANCH

Follow the link if you wish to make additional comments to the commit. When
you are finished, enter PR to make a pull request for the author to review.

You will be prompted to enter a message for your pull commit. The first line
will be the title of your pull request. Any lines after that will be written
in a description under the title."
while true; do
  read -p "PR or EXIT: " response
  case $response in
    [Pp][Rr] ) break;;
    [Ee][Xx][Ii][Tt] ) exit;;
    * ) echo "Please answer PR or EXIT.";;
  esac
done
hub pull-request
