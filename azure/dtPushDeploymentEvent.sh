#########################################
# Push Dynatrace event using the Dynatrace API
# 
# Arguments:
# $1 = Dynatrace URL  
# $2 = Dynatrace Token
# $3 = Tag value for environment
# $4 = Tag value for kubernetes app
# $5 = $(Release.DefinitionName)
# $6 = $(Release.ReleaseId)
# $7 = $(System.TeamProject)
# $8 = $(System.TeamFoundationCollectionUri)
#
# Example parm values
# $(dynatraceTennantUrl) $(dynatraceApiToken) dev carts $(Release.DefinitionName) $(Release.ReleaseId) $(System.TeamProject) $(System.TeamFoundationCollectionUri)
##########################################
postData=$(cat <<EOF
    {
        "eventType" : "CUSTOM_DEPLOYMENT",
        "source" : "AzureDevops" ,
        "deploymentName" : "$5",
        "deploymentVersion" : "$6"  ,
        "deploymentProject" : "$7" ,
        "ciBackLink" : "$8",
        "attachRules" : {
               "tagRule" : [
                   {
                     "meTypes":"SERVICE" ,
                     "tags" : [
                       {
                         "context" : "KUBERNETES",
                         "key": "app",
                         "value" : "$4"    
                       },
                       {
                         "context" : "CONTEXTLESS",
                         "key": "environment",
                         "value" : "$3"    
                       }
                     ]
                   }
                ]
        }
    }
EOF)

url="$1/api/v1/events"
echo "Dynatrace URL      : $url"
echo "Dynatrace Token    : $2"
echo "Environment Tag    : $3"
echo "Kubernetes App Tag : $4"
echo "Body: $postData"
curl --url "$url" -H "Content-type: application/json" -H "Authorization: Api-Token "$2 -X POST -d  "$postData"