# StopWatch
Stop Watch mobile application by Flutter and Firebase

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 1.56.59 PM.png">
</p>

<p> Application Demo </p>
![](https://www.loom.com/share/7ef8c97d8f154267a2c4f3ff06facfcc)
# Introduction
<p> Nowadays, smartphones are used for communication, work, and entertainment making them an essential item in people’s lives. However, people tend to spend too much time on their phone, and it affects work productivity. </p>

<p> Stop Watch is a cross-platform mobile application for both IOS and Android device that aims to assist user with avoiding distraction from smartphone. It helps user improve time management to increase productivity on studying and working. </p>

# Requirements: 
<p> Stop Watch has a number of high level functional features as listed: </p>
	<p> - Register: User can register an account with email and password before login. </p>
	<p> - Login: User can login with registered account to use the app </p>
	<p> - Profile Page: User can see their profile with register information. </p>
	<p> - Add Sprint: User can add a sprint with name, duration and motivating quote. </p>
	<p> - Sprint: User can start, pause, stop and continue while on a sprint.</p>
	<p> - Save Sprint: User can save completed sprint and view it in a list. </p>
<p>Stop Watch has nonfunctional requirement features:  </p>
	<p> - Navigation bar: User can navigate between pages using the navigation bar. </p>
	<p> - Navigability: User can easily navigate to the add new sprint under 3 clicks. </p>

# Technological choice: 
<p> Stop Watch is developed with mobile UI framework Flutter (version 1.20.4) in Dart (version 2.9.2) programming language. The application works with Firebase NoSQL database for backend services. </p>
<p> Flutter and Dart: Flutter supports mobile application by enabling cross-flatform development from one single codebase deployment. </p>
<p> Firebase: is a Backend-as-a-Service platform that supports authentication and real-time database storage. </p>
<p> The application applies best practices by Flutter: </p>
	<p> - Dividing screen into reusable widgets that promotes reusability and reduce complexity of the program. </p>
	<p> - Implementing state management to share data between screens using Provider pattern. </p>
<p> The current version of Stop Watch only works in local environment.</p>

# Technology Implementation: 

<p> All technologies used in this project was learned through Udemy online courses, Flutter documentation: flutter.dev, pub.dev and Firebase documentation page: firebase.google.com. </p>
<p> I decide to learn and implement these technologies because they are innovated and widely used for mobile application development in the industry. </p>

# Technology approach: 
<p> 1.The tools and technologies used in this project: <p>
	
<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-UsedTechnology.png">
</p>
		
<p> 2. ER Diagram: </p> 
<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-ERDiagram.png">
</p>
<p> 3. Use Case Diagram: </p> 

<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-UseCaseDiagram.png">
</p>
	
<p> 4.Site Map Diagram: </p>

<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-SiteMap.png">
</p>
	
<p> 5.Navigation Map Diagram: </p>

<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-NavigationMap.png">
</p>
	
<p> 6.Class Diagram: </p>

<p align="center">
<image src="stopwatch/Stop Watch Diagram/StopWatch-UMLDiagram.png">
</p>
	
# Challenges: 

<table>
	<thead>
		<tr>
			<th> Challenges </th>
			<th> Challenge Mitigation </th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td> Time management </td>
				<td> Plan feature in details, follow sprint strictly</td>
			</tr>
			<tr>
				<td> Unexperienced in mobile application development</td>
				<td> Study Udemy material and review documentation for Flutter and Firebase</td>
			</tr>
			<tr>
 			<td> Lack of knowledge in Flutter and Dart</td>
				<td> Review study material closely and plan feature ahead of time </td>
			</tr>
			<tr>
				<td> Lack of skill in designing user interface </td>
				<td> Spend time in designing and review deisgn templates</td>
			</tr>
		</tbody> 
	</table>

# Risk Management: 
<table>
		<thead>
			<tr>
				<th> Event Risk </th>
				<th> Risk Probability </th>
				<th> Risk Impact </th>	
				<th> Risk Mitigation </th>
				<th> Contingency Plan</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td> Lack of knowledge in Dart and Flutter </td>
				<td> High </td>
				<td> Delay in development  </td>
				<td> Study from online source, Read documentation (flutter.dev) </td>
				<td> Plan and study reasonably before development </td>
			</tr>
			<tr>
				<td> Feature is too complicated </td>
				<td> High </td>
				<td> Unable to complete planned feature  </td>
				<td> Plan feature carefully before adding feature to the project </td>
				<td> Remove feature as Out of scope </td>
			</tr>
<tr>
				<td> Time management </td>
				<td> Medium </td>
				<td> Delay in development & affect estimated time deliver </td>
				<td> Follow schedule closely </td>
				<td> Plan for extra time on development </td>
			</tr>
<tr>
				<td> Hardware failure </td>
				<td> Low </td>
				<td> Potential code loss </td>
				<td> Regularly save work on external hard drive & github </td>
				<td> Maintain device correctly </td>
			</tr>
		</tbody> 
	</table>

# Known Issue:
<p> 	This application currently has no outstanding issues.  </p>

# User Interface

<p> 1. Login Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 1.59.28 PM.png">
</p>
	
<p> 2. Register Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 1.59.51 PM.png">
</p>
	
<p> 3. Dash Board Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.00.40 PM.png">
</p>

<p> 4. New Sprint Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.02.11 PM.png">
</p>
	
<p> 5. Count Down Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.02.42 PM.png">
</p>
	
<p> End Sprint Alert </p>
<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.04.02 PM.png">
</p>

<p> Complete Sprint Alert </p>
<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.06.04 PM.png">
</p>
	
<p> 6. Completed Sprints Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.06.30 PM.png">
</p>
	
	

<p> 6. Completed Sprint Detail Screen </p>

<p align="center">
<image src="Diagram/Screen Shot 2021-04-08 at 2.06.53 PM.png">
</p>
	

