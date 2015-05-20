package com.demo.innterceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class BasiceInterceptor implements Interceptor {

	@Override
	public void intercept(ActionInvocation ai) {
		// TODO Auto-generated method stub

		if (ai.getController().getSession().getAttribute("name") != null) {
			ai.invoke();
			} else {
			ai.getController().redirect("/");
		}
	}

}
