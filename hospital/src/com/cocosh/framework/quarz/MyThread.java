package com.cocosh.framework.quarz;

public class MyThread extends Thread {

	private int i=0;
	@Override
	public void run(){
	  for(;i<10;i++){
		  System.out.println(getName()+"\t"+i);
	  }
	}
}
