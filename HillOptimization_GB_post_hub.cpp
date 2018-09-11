// HillOptimization_GBplaces_DistanceMinimizer.cpp
// 
// this program takes a random point and finds the distance to all places in GBplaces.csv from this point
// by moving small steps (iterations), the random point tends towards a minimum position
// at the minimum position, the point stops moving
//
// this could happen at a local minimum - we want the global minimum 
//
// this is repeated (loops) many times to try and find the global minimum
// 
// sometimes the global minimum is found quickly, sometimes in the last few loops of a few hundred
//
// low step size is needed to accurately and consistently give this global minimum
// low step size requires many iterations
// by varying step size, accuracy and speed can both be had
//
//                   ___________________
//                      instructions
//
// Simply run the program, and choose the version you want to run!
//       (it may take a while to give a good result)
//
//
//// The program seems to work for variants [1] and [2], but not for [3] and [4]
//// this is a shame, as step-varying would have saved a lot of time in checking the right values come out of the program!
//// four slashes like this indicates the a step-varying part of the code, i.e. code that would be used for variant [3] or [4] (if it worked!)
////  
//                 ___________________
//                     other notes
//
// fixed step size is especially bad, as I have the randomly generated point be anywhere in quite a large area
//
// population weighting is smart, as it is a simple way of solving the problem that more populous places need more mail
//
//
// two-hub optimisation would be trialed by choosing a horizontal line (from the GBplaces visualisation I made weeks ago)
// this would have some human error, but choosing your cut-off point for north and south isn't bad - if you can reason why 
// you're cutting off where you are.  
//
// this would be implmented simply by using if (data [n][1] > #) {///}, where /// gives you a northern hub location,
// similarly for south. I'd have a go at doing this, but I'm jittery and spent too long try to figure out
// how to get varying step size to work without copy-pasting large sections of code
//
// I hope that I have commented (and indented) this sensibly and that you can read it quickly,
//
// James Clark - 12/12/14

#include <iostream>
#include <cmath>
#include <time.h>
#include <fstream>
#include <vector>
#include <string>
#include <cstdlib> // used to stop cout being ambiguous
#include <Windows.h> // used for the Sleep(ms) function 

#define PI 3.14159 
#define deg2rad PI/180 // this is a conversion factor, as radians are needed to find Haversine distance
#define R 3958.75 // this is the radius of the earth, in miles

using namespace std;


// Here is the Haversine formula, which is used to find distances between the current location and all the 100 GB places locations
// It is called from the main progam *many* times, so putting it here is the only logical thing to do

double HaversineDistance(double lat2, double long2, double lat1, double long1) // two latitudes and two longitudes are needed
{
	double dLat, dLong, a, c, distance;

	dLat = (lat2 - lat1)*deg2rad;
	dLong = (long2 - long1)*deg2rad;
	a = sin(dLat / 2)*sin(dLat / 2) + cos(lat1*deg2rad)*cos(lat2*deg2rad)*sin(dLong / 2)*sin(dLong / 2); // writing pow(X,2) as X*X, and pow(X,0.5) as sqrt(X)
	c = 2 * atan2(sqrt(a),sqrt(1 - a));
	distance = R*c;
	return distance; // the output of the function is the great-circle distance between the two input points
}


// a function which generates a random number from a seed is required, so that we can have random initial longitudes and latitudes to optimise

double random_number ( double lower, double upper, int n ) // note the lower and upper limits - the choice of these will be explained later
{
  // function to return a random number between two limits, lower and upper
  // n is the amount of bits to split the range into
  double r;
  r = lower + (rand() % (n + 1) * (1./n) * (upper-lower));
  return r;
}



int main() {
	// declare variables which have global scope

	double x, y; // holds the current best values of x and y 
	int dx = 0, dy = 0; // these store the direction of the step
	double oldValue, minValue;
	double globalminValue = INFINITY; // need to initialise this as "some high value", which the minima points can be less than and thus overwrite this value
	double globalx, globaly; // this is just so the longitudes and latitudes can be extracted to the final output

	srand((unsigned int)time(NULL)); // seeds the random number generator. unsigned removed a build error. only need to seed once for all iterations and loops

	int numloops = 200; // how many minima the program finds
	double step = 0; // this value will not be used, but is initialised here anyway



	// import the population, latitude, and longitude data from GBplaces.csv
	// this works similarly to the previous assessment 
	// the changes are: the first line is ignored and only certain substrings are taken
	vector < vector <double> > data; // create a (2D) vector of (1D) vectors

	// open the file for importing data
	ifstream myfile("GBplaces.csv");
	if (myfile.is_open())
	{
		string dummyLine; 
		getline(myfile, dummyLine); // the headers have been read as a dummy line, and are skipped
		while (!myfile.eof()) // eof allows all the rows of data to be converted individually
		{
			vector <double> temp; // create a 1D vector to store values
			string bLine;
			getline(myfile, bLine); // grab the immediate line as a string
			int X = 0; // set a counter to zero - we only want population, latitude and longitude, X controls this
			while (bLine.find(",", 0) != string::npos) // loop until there isn't a comma at the end of the string
			{
				int comma_pos = bLine.find(",", 0); // find the first commas position
				double valuedata = atof(bLine.substr(0, comma_pos).c_str()); // take from the start to the comma (excluding it the comma of course!), and convert to a number
				if (X == 2 || X == 3) // [X==0 is place], [X==1 is type]. longitude is acquired outside of this inner while loop
				{
					temp.push_back(valuedata); // push population and latitude to the 1D temporary vector
				}
				bLine = bLine.substr(comma_pos + 1, bLine.size() - comma_pos - 1); 	//  remove the substring up to and including the first comma	
				X++; // increase X which each substring inspected
			}

			// values up to the last comma have been imported to the temporary 1D vector
			// the final value doesn't have a comma after it so hasn't been extracted!
			temp.push_back(atof(bLine.c_str())); // push back the last substring (after converting to type double)
			data.push_back(temp); // push back one row's population, latitude and longitude to the 2D vector, then move onto the next row (because of eof)
		}

		// close the file after reading from it
		myfile.close();  
	} // file isn't open


	else // file couldn't be opened, so tell the user and exit
	{
		cout << "Unable to open file. Please ensure that GBplaces.csv is in the correct directory.";
		Sleep(5000); // give the user a few seconds to read the message, then exit
		exit(1);
	}

	
	// Now the user is asked which version of the program they want to run!

	int programversion; 
	cout << "Which program version would you like to run? Basic [1], Population-weighted [2], step-varying population weighted [3], or step-varying two-hub population weighted [4]?\n";
	cin >> programversion;

	while (programversion != 1 && programversion != 2 && programversion != 3 && programversion !=4) // if the user hasn't made a valid choice:
	{ 
		cin.clear(); // clear the failed input from the last attempt 
		cin.ignore(); // ignore the failed input from the last attempt - these two commands prevent the while loop carrying itself out indefinitely
		cout << "That is not a correct input - please choose [1], [2], [3], or [4].\n"; // regardless of whether the user types "a" or "78", this will loop until they choose "1","2", or "3"
		// note: that validation isn't perfect here; entering "8.2" would trigger program version 2, as would "ab2" 
		cin >> programversion;
		if (programversion == 1 || programversion == 2 || programversion == 3 || programversion ==4)
		{
			break; // break out of this while loop if the user correctly chooses a program
		}
	}

	// double check the User is aware that program variants [3] and [4] don't work
	if (programversion == 3 || programversion == 4)
	{
		cout << "\nSorry User, this code hasn't been finished - you can only run program version [1] and [2].\n";
		cout << "\nPlease exit the program and try again, with program version [1] or [2].\n";
	}








	// define the step length for fixed step variant programs
	if (programversion == 1 || programversion == 2)
	{
		step = 0.0002; // small step for constant step programs - slow but accurate!
		cout << "Finding minimum total distance for your choice of program, with " << numloops << " loops, and step size of " << step << ".\n\n";
		// if you want to change numloops, head back to line 104
	}


	// | loop starts |
	for (int A = 0; A < numloops;) // this is how many loops the program goes through, i.e. how many minima it finds
		{
			int iteration = 1; // 


		   // pick a starting point which is confined by the limits of longitude and latitude in GBplaces.csv
			x = random_number(-4.25763, 1.29834, 200);  // x is a longitude
			y = random_number(50.37153, 57.14369, 200); // y is a latitude


			double value = 0; // this double has to be set to = 0, as it's a summation (from 0!) - it also has to reset each loop

			// find out how good the starting point is
			// this value will be used to compare the step-optimised values with
			for (int n = 0; n < 100; n++) // for 100 places (there are 100 in GBplaces.csv!)
			{
				double distance;

				if (programversion == 2) //// || programversion == 3 || programversion == 4) // for programs which weight by population
				{
				distance = data[n][0] * HaversineDistance(y, x, data[n][1], data[n][2]); // find the distance between the starting point and each location from GBplaces.csv
				value += distance; // make a running sum of the distances - this is the thing we're trying to minimise
				}

				else // if not weighting by popultion
				{
					distance = HaversineDistance(y, x, data[n][1], data[n][2]); // just find the distance between the starting point and each location
					value += distance; // make a running sum of these distances
				}
			}

			// now we have "value", which is the total distance
			// we can try to minimise this by taking steps, with the hill climbing function


			// keep taking steps to try and minimise the total distance, "value"
			do // this is the do-while loop
			  // it carries on going until there is no step to take which can decrease the total distance
			{
			     	// for step varying programs (3 & 4) reset the step size with each loop
				    // remember that for programs 1 & 2, step size is 0.0002 
				    ////if ((programversion == 3 || programversion == 4) && (iteration = 1)) //  for the first iteration in the loop, use step size 0.1
				   //// {
					////step = 0.1; // this gets smaller as more precision is needed
					////}


				// save the current value
				oldValue = value; // write down the last iterations value which you want to beat
				// initially this is the value from the starting position
				minValue = oldValue; // set the minValue for the local search 


				// inspect steps in different directions
				for (int i = -1; i <= 1; i++) {
					for (int j = -1; j <= 1; j++) {
						// this gives 9 points including the current point (including when i=0, j=0)
						if (i == 0 && j == 0)
						{ // do nothing - a simple way to save ~ 1/9th of iterations
						}

						else {
							double newValue = 0; // reset the newValue
							for (int n = 0; n < 100; n++) // for each location in GBplaces...
							{
								double distance2; // define (very locally) the distance between points
								if (programversion == 2) //// || programversion == 3 || programversion == 4) // if weighting by population:
								{
									distance2 = data[n][0] * HaversineDistance(y + step * i, x + step * j, data[n][1], data[n][2]); // times distances by population
									newValue += distance2; // sum
								}

								else // don't weight by population
								{
									distance2 = HaversineDistance(y + step * i, x + step * j, data[n][1], data[n][2]); // find distances
									newValue += distance2; // sum
								}
							}

							if (newValue <= minValue) // is the total distance (for any variant program) less than the old value?
							{
								// yes - so overwrite minValue, and save point i,j values
								// i and j will be used to update x and y - just a few lines later on!
								dx = i;
								dy = j;
								minValue = newValue;
							}
						}
					}
				}

				// update x and y to new point with lower total distance
				x += step * dx;
				y += step * dy;
				value = minValue;


				iteration++; // add one to the iteration counter
				
				//  // here is my attempt at varying step size - it doesn't work, unfortunately!
				//  // change the step size for step-varying variants of the program
				////if ((programversion == 3 || programversion == 4) && (value == minValue)) // maybe value == oldValue
				////{
				////	step = step/10; // make the step 10x smaller when more precision is needed, for the step-varying variant 
				////}
				////if ((step != 0.00001) && (programversion == 3 || programversion == 4))
				////{
				//      // don't let the loop end until precision has ben reached!
				////	value = value - 1;
				////}
             
			}	while (value < oldValue); // repeat all these iterations until we can't find a smaller total distance than the previous one
			

			// there are several loops which immediately fail - ignore these by only considering iteratin>5
			// unfortunately this is only a hack, and doesn't fix the problem
			// however, the chance of the initial (random) point being very close to global minimum is low 
			// and there are only low number of failed literations (many failed loops though) means low computational waste
			
	   // if a loop suceeded, tell the user how many iterations it used, the location of the point, and it's total (weighted or not) distance
				cout << "Iterations: " << iteration << "  longitude: " << x << "  latitude: " << y << "  distance: " << value << endl; 
				A = A + 1; // add one to A (remove 1 from number of loops yet to be carried out), and move on to next randomly generated seed
		

			
			if ((value < globalminValue) && (iteration >5)) // if the distance from a loop is the smallest found so far, tell the user and overwrite the current smallest value 
			{
				globalminValue = value;
				globalx = x;
				globaly = y;
				cout << "\nThe smallest minimum point found so far has total distance " << globalminValue << "\n\n"; // notify the user that a new minimum has been found
				// the locaton of this new minimum is shown later on with the globalx and globaly variables

			}

		} // |Loop end| (finally!)
		
		// conclude with the following information: 
		cout << "The lowest minimum point has total distance " << globalminValue << "\n";
		cout << "The latitude of this point is " << globaly << "\n";  
		cout << "The longitude of this point is " << globalx << "\n"; 
		cout << "If you expected something different, try with a higher number of loops, which has variable numloops. This run used " << numloops << " loops.\n";


		return 0;
}