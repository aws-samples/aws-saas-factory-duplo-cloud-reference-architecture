package com.saas.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.amazonaws.services.cognitoidp.AWSCognitoIdentityProvider;
import com.amazonaws.services.cognitoidp.AWSCognitoIdentityProviderClientBuilder;
import com.amazonaws.services.cognitoidp.model.AdminCreateUserRequest;
import com.amazonaws.services.cognitoidp.model.AdminCreateUserResult;
import com.amazonaws.services.cognitoidp.model.AttributeType;
import com.amazonaws.services.cognitoidp.model.UserType;
import com.saas.model.User;
import com.saas.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Value("${USER_POOL_ID}")
    private String userPoolId;
    
    @Override
    public void save(User user) {
    	createUser(user);
    }
    
    public UserType createUser(User user) {
    	
    	AWSCognitoIdentityProvider cognitoIdentityProvider = AWSCognitoIdentityProviderClientBuilder.defaultClient();

	AdminCreateUserResult createUserResult = cognitoIdentityProvider
			.adminCreateUser(new AdminCreateUserRequest().withUserPoolId(this.userPoolId)
					.withUsername(user.getUsername())
					.withUserAttributes(new AttributeType().withName("email").withValue(user.getUsername()),
							new AttributeType().withName("email_verified").withValue("true")));

	UserType cognitoUser = createUserResult.getUser();
	
	return cognitoUser;

    }
}
