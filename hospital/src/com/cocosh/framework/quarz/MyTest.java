package com.cocosh.framework.quarz;

public class MyTest {
	public static void main(String[] args) {
		for(int i=0;i<10;i++){
			System.out.println(Thread.currentThread().getName()+"\t"+i);
			if(i==5){
				  MyThread t1=new MyThread();
				  MyThread t2=new MyThread();
				  t1.start();
				  t2.start();
				  
			  }
		}
	}
}
