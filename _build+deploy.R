# BUILD
# Run the build line to render .Rmd to .html, and to serve the preview website
# on the preview port

system("bash _build.sh",wait=T)

# PREVIEW
# Replace 'index.html' with whichever page you're working on. After opening it
# the first time you can just reload the browser.

getOption("viewer")('/home/rstudio/_book/index.html') 

# DEPLOY
# Always after building, run the deploy line to copy .html from the preview
# folder to the deployment folder (/home/rstudio/docs/), commit all changes, add
# a robots.txt, and prepare for manual push to origin. Even after running the
# script your site will NOT be deployed until you push.

system("bash _deploy.sh",wait=T)
