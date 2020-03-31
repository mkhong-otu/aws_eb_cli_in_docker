# AWS EB CLI In Docker
AWS Elastic beanstalk CLI in Docker

# Usage
```shell script
cd {eb_project_path}
echo -e "[default]\naws_access_key_id={access_key}}\naws_secret_access_key={secret_key}" > aws_profile
docker run -it --rm -v {eb_project_path}:/app printenv {command}
```

