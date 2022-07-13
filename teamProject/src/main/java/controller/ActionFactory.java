package controller;

import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;

public class ActionFactory {
	public ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action =null;
		
		if (command.equals("join")) action = new JoinAction();
		else if(command.equals("login")) action = new LoginAction();
		else if(command.equals("logout")) action = new LogoutAction();
		else if(command.equals("writeBoard")) action = null;
		else if(command.equals("updateBoard")) action = null;
		else if(command.equals("deletevBoard")) action = null;
		
		return action;
	}
}
