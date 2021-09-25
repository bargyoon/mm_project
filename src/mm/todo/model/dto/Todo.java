package mm.todo.model.dto;

import java.sql.Date;

public class Todo {
/*
	TODO_IDX
	USER_IDX
	START_DATE
	END_DATE
	TITLE
	DONE
	COLOR
*/	
	
	private int todoIdx;
	private int userIdx;
	private Date startDate;
	private Date endDate;
	private String title;
	private boolean done;
	private String color;
	
	public Todo() {
		// TODO Auto-generated constructor stub
	}

	public int getTodoIdx() {
		return todoIdx;
	}

	public void setTodoIdx(int todoIdx) {
		this.todoIdx = todoIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isDone() {
		return done;
	}

	public void setDone(boolean done) {
		this.done = done;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public String toString() {
		return "Todo [todoIdx=" + todoIdx + ", userIdx=" + userIdx + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", title=" + title + ", done=" + done + ", color=" + color + "]";
	}
	
	
	

	
	
}
