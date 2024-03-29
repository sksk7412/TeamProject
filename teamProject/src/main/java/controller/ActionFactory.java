package controller;

import controller.action.DeleteDibsAction;
import controller.action.DeleteLisAction;
import controller.action.DibsAction;
import controller.action.JoinAction;
import controller.action.LibraryAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.UpdateAction;
import controller.action.WriteReviewAction;

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
		else if(command.equals("DibsBook")) action = new DibsAction();
		else if(command.equals("writeReview")) action = new WriteReviewAction();
		else if(command.equals("DibsBook")) action = new DibsAction();
		else if(command.equals("updateUser")) action = new UpdateAction();
		else if(command.equals("deleteDibs")) action = new DeleteDibsAction();
		else if(command.equals("addLibrary")) action = new LibraryAction();
		else if(command.equals("deleteLis")) action = new DeleteLisAction();
		else if(command.equals("updateBoard")) action = null;
		else if(command.equals("deleteBoard")) action = null;
		
		
		return action;
	}
}
