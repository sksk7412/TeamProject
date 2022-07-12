package controller;

import controller.action.JoinAction;

public class ActionFactory {
	public ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action =null;
		
		if (command.equals("join")) action = new JoinAction();
		else if(command.equals("login")) action = null;
		else if(command.equals("logout")) action = null;
		else if(command.equals("writeBoard")) action = null;
		else if(command.equals("updateBoard")) action = null;
		else if(command.equals("deletevBoard")) action = null;
		
		return action;
	}
}
