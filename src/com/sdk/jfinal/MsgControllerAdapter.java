/**
 * Copyright (c) 2011-2014, James Zhan 詹波 (jfinal@126.com).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.sdk.jfinal;

import com.sdk.msg.in.InImageMsg;
import com.sdk.msg.in.InLinkMsg;
import com.sdk.msg.in.InLocationMsg;
import com.sdk.msg.in.InTextMsg;
import com.sdk.msg.in.InVideoMsg;
import com.sdk.msg.in.InVoiceMsg;
import com.sdk.msg.in.event.InFollowEvent;
import com.sdk.msg.in.event.InLocationEvent;
import com.sdk.msg.in.event.InMenuEvent;
import com.sdk.msg.in.event.InQrCodeEvent;
import com.sdk.msg.in.speech_recognition.InSpeechRecognitionResults;


/**
 * MsgControllerAdapter 对 MsgController 部分方法提供了默认实现，
 * 以便开发者不去关注 MsgController 中不需要处理的抽象方法，节省代码量
 */
public abstract class MsgControllerAdapter extends MsgController {
	
	protected abstract void processInFollowEvent(InFollowEvent inFollowEvent);
	
	protected abstract void processInTextMsg(InTextMsg inTextMsg);
	
	protected abstract void processInMenuEvent(InMenuEvent inMenuEvent);
	
	protected void processInImageMsg(InImageMsg inImageMsg) {
		
	}
	
	protected void processInVoiceMsg(InVoiceMsg inVoiceMsg) {
		
	}
	
	protected void processInVideoMsg(InVideoMsg inVideoMsg) {
		
	}
	
	protected void processInLocationMsg(InLocationMsg inLocationMsg) {
		
	}
	
	protected void processInLinkMsg(InLinkMsg inLinkMsg) {
		
	}
	
	protected void processInQrCodeEvent(InQrCodeEvent inQrCodeEvent) {
		
	}
	
	protected void processInLocationEvent(InLocationEvent inLocationEvent) {
		
	}
	
	protected void processInSpeechRecognitionResults(InSpeechRecognitionResults inSpeechRecognitionResults) {
		
	}
}
