### Installing Docker on Ubuntu

Follow these steps to install Docker on a fresh Ubuntu machine.
  
### Step 1: Update Your Existing List of Packages

```
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install Necessary Packages

These packages allow `apt` to use packages over HTTPS.

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
```

### Step 3: Add the GPG Key for the Official Docker Repository to Your System

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

### Step 4: Add the Docker Repository to `APT` Sources

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
```

### Step 5: Update the Package Database with the Docker Packages from the Newly Added Repo

```
sudo apt update
```

### Step 6: Install Docker

```
sudo apt install docker-ce -y`
```

### Step 7: Add Your User to the Docker Group

This step allows you to run `docker` commands without `sudo`.

```
sudo usermod -aG docker ${USER}`
```

### Step 8: Apply the New Group Membership

Log out and log back in so that your group membership is re-evaluated. Alternatively, you can use the following command to activate the changes to groups:

```
su - ${USER}`
```
