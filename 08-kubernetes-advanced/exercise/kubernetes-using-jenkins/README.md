## Deploy to Kubernetes Using Jenkins on KodeKloud Free playground

1. Launched 2 EC2 instances
    # Launch an ec2 server - Jenkins-Master
    AMI - Ubuntu(Free tier)

    Instance Type - t3.micro (free tier)

    Select or create Key Pair

    Configuration Storage - 15 GiB

    # Launch an ec2 server - Jenkins-Agent
    AMI - Ubuntu(Free tier)

    Instance Type - t3.micro (free tier)

    Select or create Key Pair

    Configuration Storage - 15 GiB

    # S

    Create EC2 Master + EC2 Agent manually

    Attach Security Groups:

    Master: allow 8080 from your IP (or temporarily 0.0.0.0/0), allow 22 from your IP

    Agent: allow 22 from Master SG (best) or your IP for now

    SSH into master → run master script

    SSH into agent → run agent script

    Add agent in Jenkins (SSH agent method)

2. Open terminal & do the following
    '''
    //Change directory to the location where key pair file is located
    $ cd Downloads
    $ ssh -i [keypair-name].pem ubuntu@[public IP]
    $ sudo apt update
    $ sudo apt upgrade -y 
    //Change server hostname to avoid confusion
    $ sudo hostnamectl set-hostname Jenkins-Master
    $ bash
    '''

3. Created pre-requisite bootstrap-jenkins-master.sh & bootstrap-jenkins-agent.sh to setup config on instances
    1. Move jenkins master bootstrap-jenkins-master.sh to it's own ec2 instance
        scp -i [jenkins-master].pem bootstrap-jenkins-master.sh ubuntu@[public IP]:/home/ubuntu/

    2. Move jenkins agent bootstrap-jenkins-agent.sh to it's own ec2 instance



4. 