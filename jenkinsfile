
pipeline{
    agent any
    stages{
        stage("Clone code"){
            steps{
                echo "cloning the code "
                git url: "https://github.com/pawan7697/my_tennis_club.git", branch: "main"
            }
            
        }
        stage("Build"){
            steps{
                echo "Buliding the image"
                sh "docker build -t my_tennis_club ."
            }
            
        }
        stage("Push to docker Hub"){
            steps{
                echo "pusinh the image to docker hub"
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'DockerHUbUser', passwordVariable: 'dockerHubPASSWORD')]){
                sh "docker tag my_tennis_club ${env.DockerHUbUser}/my_tennis_club:latest"
                sh "docker login -u ${env.DockerHUbUser} -p ${env.dockerHubPASSWORD}"
                sh "docker push ${env.DockerHUbUser}/my_tennis_club:latest"
                }
            }
            
        }
        stage("deploy"){
            steps{
                echo "Deploying the container"
                sh "docker-compose down && docker-compose up -d"
            }
            
        }
    }
}