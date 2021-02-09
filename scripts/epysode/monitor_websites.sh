#! /bin/bash
#

# ---- for sheepdog
export GEM_PATH=/home/wrk/opt/deploy/lib/ruby/vendor_ruby
export PATH=/home/wrk/iwrk/deploy/deploy/bin:/home/wrk/opt/deploy/bin:$PATH

TAG=WEB_GENENETWORK_ORG
URL=https://genenetwork.org
FIND=Pjotr
echo $TAG
sheepdog_run.rb -c "curl $URL|grep $FIND" --tag $TAG $*

TAG=WEB_GENENETWORK_REST_API
URL=http://genenetwork.org/api/v_pre1/species/mouse.json
FIND=Mouse
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_GENENETWORK_GN1
URL=http://gn1.genenetwork.org/webqtl/main.py
FIND=Pjotr
echo $TAG
sheepdog_run.rb -c "curl $URL|grep $FIND" --tag $TAG $*

TAG=WEB_OPAR
URL=https://opar.io/
FIND=Rat
echo $TAG
sheepdog_run.rb -c "curl $URL|grep $FIND" --tag $TAG $*


TAG=WEB_RATS_PUB
URL="--connect-timeout 30 --retry 3 --retry-delay 5 http://rats.pub/"
FIND=Addiction
echo $TAG
sheepdog_run.rb -c "curl $URL|grep $FIND" --tag $TAG $*

TAG=WEB_PUBSEQ
URL=http://covid19.genenetwork.org/
FIND=PubSeq
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_SPARQL
URL=http://sparql.genenetwork.org/
FIND=OpenLink
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_IPFS
URL=http://ipfs.genenetwork.org/ipfs/
FIND=invalid
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_HEGP
URL=http://hegp.genenetwork.org/
FIND=hegp
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_GITEA
URL=http://git.genenetwork.org/
FIND=Gitea
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_GN3_PROXY
URL=http://genenetwork.org/gn3-proxy/version
FIND=version
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*

TAG=WEB_GN3
URL=http://genenetwork.org/gn3/
FIND=GeneNetwork
echo $TAG
sheepdog_run.rb -c "curl $URL|grep -i $FIND" --tag $TAG $*



