import json
import codecs
import cotoha_api# import CotohaApi
capi = cotoha_api.CotohaApi()
sentence = "明日はいい天気"
result = capi.parse(sentence)

# 出力結果を見やすく整形
result_formated = json.dumps(result, indent=4, separators=(',', ': '))
print (codecs.decode(result_formated, 'unicode-escape'))
