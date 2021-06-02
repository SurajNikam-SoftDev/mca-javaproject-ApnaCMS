package com.apnacms.features;

import java.util.Random;

public class RandomNumberGenerator {
	/*
	 * public static void main(String[] args) { Random rand = new Random(); int
	 * random_integer = rand.nextInt(1000000-1000) + 1000;
	 * System.out.println(random_integer);
	 * 
	 * }
	 */
	
	public static int getRandomNumber(int upperbound, int lowerbound) {
		int random_number = 0;
		
		Random rand = new Random();
		random_number = rand.nextInt(upperbound-lowerbound) + lowerbound;
	    System.out.println(random_number);
		
		return random_number;
	}
}
