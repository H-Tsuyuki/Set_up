#-*- coding:utf-8 -*-
#https://qiita.com/gossy5454/items/83072418fb0c5f3e269f
import os
import urllib.request
import json
import configparser
import codecs


# COTOHA API操作用クラス
class CotohaApi:
    # 初期化
    def __init__(self):
        # ソースファイルの場所取得
        APP_ROOT = os.path.dirname(os.path.abspath( __file__)) + "/"
    
        # 設定値取得
        config = configparser.ConfigParser()
        config.read(APP_ROOT+"config.ini")
        self.client_id = config.get("COTOHA API", "Developer Client id")
        self.client_secret = config.get("COTOHA API", "Developer Client secret")
        self.developer_api_base_url = config.get("COTOHA API", "Developer API Base URL")
        self.access_token_publish_url = config.get("COTOHA API", "Access Token Publish URL")
        self.getAccessToken()

    # アクセストークン取得
    def getAccessToken(self):
        # アクセストークン取得URL指定
        url = self.access_token_publish_url

        # ヘッダ指定
        headers={
            "Content-Type": "application/json;charset=UTF-8"
        }

        # リクエストボディ指定
        data = {
            "grantType": "client_credentials",
            "clientId": self.client_id,
            "clientSecret": self.client_secret
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()

        # リクエスト生成
        req = urllib.request.Request(url, data, headers)

        # リクエストを送信し、レスポンスを受信
        res = urllib.request.urlopen(req)

        # レスポンスボディ取得
        res_body = res.read()

        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)

        # レスポンスボディからアクセストークンを取得
        self.access_token = res_body["access_token"]


    # 構文解析API
    def parse(self, sentence):
        # 構文解析API URL指定
        url = self.developer_api_base_url + "v1/parse"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "sentence": sentence
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # 固有表現抽出API
    def ne(self, sentence):
        # 固有表現抽出API URL指定
        url = self.developer_api_base_url + "v1/ne"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "sentence": sentence
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # 照応解析API
    def coreference(self, document):
        # 照応解析API 取得URL指定
        url = self.developer_api_base_url + "beta/coreference"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "document": document
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # キーワード抽出API
    def keyword(self, document):
        # キーワード抽出API URL指定
        url = self.developer_api_base_url + "v1/keyword"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "document": document
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # 類似度算出API
    def similarity(self, s1, s2):
        # 類似度算出API URL指定
        url = self.developer_api_base_url + "v1/similarity"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "s1": s1,
            "s2": s2
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # 文タイプ判定API
    def sentenceType(self, sentence):
        # 文タイプ判定API URL指定
        url = self.developer_api_base_url + "v1/sentence_type"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "sentence": sentence
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body


    # ユーザ属性推定API
    def userAttribute(self, document):
        # ユーザ属性推定API URL指定
        url = self.developer_api_base_url + "beta/user_attribute"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "document": document
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body

    # 感情分析API
    def sentiment(self, sentence):
        # 構文解析API URL指定
        url = self.developer_api_base_url + "v1/sentiment"
        # ヘッダ指定
        headers={
            "Authorization": "Bearer " + self.access_token,
            "Content-Type": "application/json;charset=UTF-8",
        }
        # リクエストボディ指定
        data = {
            "sentence": sentence
        }
        # リクエストボディ指定をJSONにエンコード
        data = json.dumps(data).encode()
        # リクエスト生成
        req = urllib.request.Request(url, data, headers)
        # リクエストを送信し、レスポンスを受信
        try:
            res = urllib.request.urlopen(req)
        # リクエストでエラーが発生した場合の処理
        except urllib.request.HTTPError as e:
            # ステータスコードが401 Unauthorizedならアクセストークンを取得し直して再リクエスト
            if e.code == 401:
                print ("get access token")
                self.access_token = getAccessToken(self.client_id, self.client_secret)
                headers["Authorization"] = "Bearer " + self.access_token
                req = urllib.request.Request(url, data, headers)
                res = urllib.request.urlopen(req)
            # 401以外のエラーなら原因を表示
            else:
                print ("<Error> " + e.reason)

        # レスポンスボディ取得
        res_body = res.read()
        # レスポンスボディをJSONからデコード
        res_body = json.loads(res_body)
        # レスポンスボディから解析結果を取得
        return res_body



if __name__ == '__main__':
    # COTOHA APIインスタンス生成
    cotoha_api = CotohaApi()
    # 解析対象文
    sentence = "すもももももももものうち"

    # 構文解析API実行
    result = cotoha_api.parse(sentence)

    # 出力結果を見やすく整形
    result_formated = json.dumps(result, indent=4, separators=(',', ': '))
    print (codecs.decode(result_formated, 'unicode-escape'))
