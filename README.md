# Purpose

This is the configuration of the services of the FX trading platform that are "mutualized"

## Content
As of now, there are two components:  
* Consul : used to register all the services, and also to provide dynamic configuration to the services (aka feature flags)  
* Scope : used to monitor all containers and their processes on the host they run (privilegied mode)  

As such services are usually handled by other teams (infra), have their own lifecycle and access policies, this stack is separated from the business services to easier mutual management. 

## Networking  
Prior to run the stack, an explicit network is used here. It can be built using this command:  
```docker network create mutualized```

## Feature flags  
Check the txt file to check the K/V entries to add in Consul to activate connectiviy and enable FX symbols in the pricer, screens...

