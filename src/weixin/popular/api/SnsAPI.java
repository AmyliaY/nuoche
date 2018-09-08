package weixin.popular.api;

import java.net.URLEncoder;

import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.util.EntityUtils;

import weixin.popular.bean.SnsToken;
import weixin.popular.bean.User;
import weixin.popular.client.JsonResponseHandler;

/**
 * 网页授权
 * @author LiYi
 *
 */
public class SnsAPI extends BaseAPI{
	
	
	/**
	 * 通过code换取网页授权access_token
	 * @param appid
	 * @param secret
	 * @param code
	 * @return
	 */
	public SnsToken oauth2AccessToken(String appid,String secret,String code){
		HttpUriRequest httpUriRequest = RequestBuilder.post()
				.setUri(BASE_URI + "/sns/oauth2/access_token")
				.addParameter("appid", appid)
				.addParameter("secret", secret)
				.addParameter("code", code)
				.addParameter("grant_type", "authorization_code")
				.build();
		return localHttpClient.execute(httpUriRequest,JsonResponseHandler.createResponseHandler(SnsToken.class));
	}

	/**
	 * 刷新access_token
	 * @param appid
	 * @param refresh_token
	 * @return
	 */
	public SnsToken oauth2RefreshToken(String appid,String refresh_token){
		HttpUriRequest httpUriRequest = RequestBuilder.post()
				.setUri(BASE_URI + "/sns/oauth2/refresh_token")
				.addParameter("appid", appid)
				.addParameter("refresh_token", refresh_token)
				.addParameter("grant_type", "refresh_token")
				.build();
		return localHttpClient.execute(httpUriRequest,JsonResponseHandler.createResponseHandler(SnsToken.class));
	}

	/**
	 * 拉取用户信息(需scope为 snsapi_userinfo)
	 * @param access_token
	 * @param openid
	 * @param lang 国家地区语言版本，zh_CN 简体，zh_TW 繁体，en 英语
	 * @return
	 */
	public User userinfo(String access_token,String openid,String lang){
		HttpUriRequest httpUriRequest = RequestBuilder.post()
				.setUri(BASE_URI + "/sns/userinfo")
				.addParameter("access_token", access_token)
				.addParameter("openid", openid)
				.addParameter("lang", lang)
				.build();
		return localHttpClient.execute(httpUriRequest,JsonResponseHandler.createResponseHandler(User.class));
	}
}
