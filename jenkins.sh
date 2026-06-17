#STEP-1: Installing Git and Maven
yum install git maven -y

#STEP-2: Repo Information (jenkins.io --> download -- > redhat)
sudo yum install -y wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
#sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

#STEP-3: Download Java 21 and Jenkins
#sudo yum install java-21-amazon-corretto -y
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo yum install -y java-21-amazon-corretto-devel
yum install jenkins -y
#sudo mount -o remount,size=2G /tmp
sudo mount -t tmpfs -o size=2G tmpfs /tmp
#STEP-4: Start and check the JENKINS Status
systemctl start jenkins.service
systemctl status jenkins.service

#STEP-5: Auto-Start Jenkins
#chkconfig jenkins on
# Enable Jenkins to start at boot
sudo systemctl enable jenkins

# Start Jenkins immediately
sudo systemctl start jenkins

# Check status
sudo systemctl status jenkins
