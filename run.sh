PROJECT_PATH=$1

if [ -z "$PROJECT_PATH" ]
then
    PROJECT_PATH="${HOME}/latex-project-code-server"
    mkdir -p $PROJECT_PATH
fi

docker run -it -p 127.0.0.1:8080:8080 -v "${PROJECT_PATH}:/home/coder/project" rostegg/code-server-latex-env