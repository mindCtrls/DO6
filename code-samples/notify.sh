#!/bin/bash
TELEGRAM_BOT_TOKEN="8466818132:AAHvWsKO4HPz_o4tYD-quBWTP2EcsXlJNg0"
TELEGRAM_USER_ID=580298300

echo "CI_JOB_STATUS"
echo "$CI_JOB_STATUS"

sometext=qwe

if [[ "$CI_JOB_STATUS" == "success" ]]; then 
  sometext="Этап $1 успешно пройден $CI_JOB_STATUS"
else
  sometext="Этап $1 не пройден $CI_JOB_STATUS"
fi

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $sometext%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" "$URL" > /dev/null
