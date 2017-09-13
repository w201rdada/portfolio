# BUILD # Run the build line to render .Rmd to .html, and to serve the preview website on the preview port

system("bash <(dos2unix < _build.sh)",wait=F)

# DEPLOY # Always after building, run the deploy line to copy .html from the preview folder to the deployment folder (/home/oski/docs/), commit all changes, add a robots.txt, and prepare for manual push to origin. Even after running the script your site will NOT be deployed until you push.

system("bash <(dos2unix < _deploy.sh)",wait=T)
