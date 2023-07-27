-- Name : Faseeh Ur Rehman
-- RNO  : L1F21BSCS0042
-- Name : Tayyab Shehzad butt
-- RNO  : L1F21BSCS0019
-- COMPUTER SCIENCE E LEARNING PLATFORM DATABASE

use elearningplatform;
-- Create the Users table
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Name VARCHAR(255),
  ContactDetails VARCHAR(255),
  EducationalBackground TEXT,
  Username VARCHAR(50),
  Password VARCHAR(50)
);

-- Create the Course table
CREATE TABLE Course (
  CourseID INT PRIMARY KEY,
  CourseTitle VARCHAR(255),
  CourseDescription TEXT,
  InstructorID INT,
  Duration INT,
  Prerequisites TEXT,
  FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);


-- Create the Enrollment table
CREATE TABLE Enrollment (
  EnrollmentID INT PRIMARY KEY,
  UserID INT,
  CourseID INT,
  EnrollmentDate DATE,
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create the Progress table
CREATE TABLE Progress (
  ProgressID INT PRIMARY KEY,
  EnrollmentID INT,
  CompletedModules INT,
  QuizzesCompleted INT,
  AssignmentsCompleted INT,
  OverallCourseCompletionStatus VARCHAR(50),
  FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);

-- Create the CourseContent table
CREATE TABLE CourseContent (
  ContentID INT PRIMARY KEY,
  CourseID INT,
  ModuleTitle VARCHAR(255),
  LessonMaterials TEXT,
  LectureVideos TEXT,
  Quizzes TEXT,
  Assignments TEXT,
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create the DiscussionForum table
CREATE TABLE DiscussionForum (
  ForumID INT PRIMARY KEY,
  CourseID INT,
  UserID INT,
  PostTitle VARCHAR(255),
  PostContent TEXT,
  PostDate DATE,
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the PostComments table
CREATE TABLE PostComments (
  CommentID INT PRIMARY KEY,
  ForumID INT,
  UserID INT,
  CommentContent TEXT,
  CommentDate DATE,
  FOREIGN KEY (ForumID) REFERENCES DiscussionForum(ForumID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create the Grading table
CREATE TABLE Grading (
  GradingID INT PRIMARY KEY,
  EnrollmentID INT,
  AssignmentID INT,
  Grade INT,
  Feedback TEXT,
  FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID),
  FOREIGN KEY (AssignmentID) REFERENCES CourseContent(ContentID)
);

-- Create the Notifications table
CREATE TABLE Notifications (
  NotificationID INT PRIMARY KEY,
  UserID INT,
  NotificationContent TEXT,
  NotificationDate DATE,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
INSERT INTO Course (CourseID, CourseTitle, CourseDescription, InstructorID, Duration, Prerequisites)
VALUES
  (1, 'Computer Graphics', 'Explore the principles and techniques of computer graphics.', 1001, 75, 'Introduction to Programming'),
  (2, 'Software Testing and Quality Assurance', 'Learn strategies for testing and ensuring software quality.', 1002, 60, 'Introduction to Programming'),
  (3, 'Operating Systems', 'An in-depth study of operating systems and their components.', 1003, 90, 'Introduction to Programming'),
  (4, 'Cybersecurity Fundamentals', 'Learn the basics of cybersecurity and protecting computer systems.', 1004, 45, 'None'),
  (5, 'Data Warehousing and Business Intelligence', 'An introduction to data warehousing and business intelligence concepts.', 1005, 60, 'Database Management'),
  (6, 'Computer Networks', 'Explore the fundamentals of computer networking and protocols.', 1006, 75, 'Introduction to Programming'),
  (7, 'Software Architecture and Design', 'Learn principles and techniques for designing software architectures.', 1007, 90, 'Software Engineering'),
  (8, 'Big Data Analytics', 'An in-depth course on analyzing and managing large-scale data.', 1008, 90, 'Database Management'),
  (9, 'Cloud Computing', 'Explore cloud computing platforms and services.', 1009, 60, 'Introduction to Programming'),
  (10, 'Natural Language Processing', 'Learn techniques for processing and understanding human language.', 1010, 75, 'Artificial Intelligence'),
  (11, 'Introduction to Robotics', 'An introductory course on robotics and its applications.', 1011, 60, 'Introduction to Programming'),
  (12, 'Software Project Management', 'Learn project management techniques for software development.', 1012, 90, 'Software Engineering'),
  (13, 'Computer Vision', 'Explore the fundamentals of computer vision and image processing.', 1013, 75, 'Introduction to Programming'),
  (14, 'Data Mining', 'An introduction to data mining concepts and algorithms.', 1014, 60, 'Database Management'),
  (15, 'Internet of Things', 'Learn about connecting and managing devices in the Internet of Things.', 1015, 75, 'Introduction to Programming'),
  (16, 'Digital Marketing', 'An introductory course on digital marketing strategies and techniques.', 1016, 60, 'None'),
  (17, 'Machine Learning for Business', 'Learn how machine learning is applied in business contexts.', 1017, 90, 'Introduction to Programming, Data Science and Analytics'),
  (18, 'Parallel Computing', 'Explore techniques for parallel computing and distributed systems.', 1018, 75, 'Introduction to Programming'),
  (19, 'Ethical Hacking', 'Learn ethical hacking techniques and practices.', 1019, 60, 'Cybersecurity Fundamentals'),
  (20, 'Blockchain Technology', 'An introduction to blockchain technology and its applications.', 1020, 90, 'Introduction to Programming'),
  (21, 'Digital Design', 'Explore the principles of digital design and electronic circuits.', 1021, 60, 'Introduction to Programming'),
  (22, 'Software Localization', 'Learn techniques for adapting software for different languages and cultures.', 1022, 75, 'Software Engineering'),
  (23, 'Quantum Computing', 'An introduction to the principles and applications of quantum computing.', 1023, 90, 'Introduction to Programming'),
  (24, 'Introduction to Programming', 'An introductory course on programming concepts.', 1024, 60, 'None'),
  (25, 'Database Management', 'A comprehensive course on managing relational databases.', 1025, 90, 'None'),
  (26, 'Web Development Fundamentals', 'Learn the basics of web development including HTML, CSS, and JavaScript.', 1026, 45, 'None'),
  (27, 'Object-Oriented Programming', 'Explore the principles of object-oriented programming and design.', 1027, 75, 'Introduction to Programming'),
  (28, 'Data Structures and Algorithms', 'Learn about common data structures and algorithms used in software development.', 1028, 90, 'Introduction to Programming'),
  (29, 'Network Security', 'An in-depth course on network security and best practices.', 1029, 60, 'None'),
  (30, 'Mobile App Development', 'Build mobile applications for iOS and Android platforms.', 1030, 90, 'Introduction to Programming'),
  (31, 'Artificial Intelligence', 'Explore the concepts and applications of artificial intelligence.', 1031, 75, 'Introduction to Programming'),
  (32, 'Software Engineering', 'Learn about software development methodologies and best practices.', 1032, 90, 'Introduction to Programming'),
  (33, 'Data Science and Analytics', 'An introduction to data science and analytics techniques.', 1033, 60, 'Introduction to Programming'),
  (34, 'Game Development', 'Learn the basics of game development and design.', 1034, 75, 'Introduction to Programming'),
  (35, 'Software Documentation', 'Explore techniques for documenting software projects.', 1035, 60, 'Software Engineering'),
  (36, 'Computer Ethics', 'An introduction to ethical considerations in computer science.', 1036, 45, 'None'),
  (37, 'Embedded Systems', 'Learn about designing and programming embedded systems.', 1037, 75, 'Introduction to Programming'),
  (38, 'Human-Computer Interaction', 'Explore the principles of designing user-friendly interfaces.', 1038, 60, 'Introduction to Programming'),
  (39, 'Data Visualization', 'An introduction to visualizing and presenting data.', 1039, 75, 'Data Science and Analytics'),
  (40, 'Mobile Game Development', 'Learn to create mobile games for iOS and Android platforms.', 1040, 90, 'Introduction to Programming, Game Development'),
  (41, 'Cloud Security', 'Explore security challenges and solutions in cloud computing.', 1041, 75, 'Cybersecurity Fundamentals, Cloud Computing'),
  (42, 'IT Project Management', 'Learn project management techniques specific to IT projects.', 1042, 90, 'None'),
  (43, 'Artificial Neural Networks', 'An in-depth study of artificial neural networks.', 1043, 60, 'Introduction to Programming, Artificial Intelligence'),
  (44, 'Geographic Information Systems', 'Explore the applications of geographic information systems.', 1044, 75, 'None'),
  (45, 'Web Design and Development', 'Learn front-end and back-end web development techniques.', 1045, 90, 'Introduction to Programming'),
  (46, 'Computer Forensics', 'An introduction to computer forensics and digital investigations.', 1046, 60, 'Cybersecurity Fundamentals'),
  (47, 'Machine Learning in Finance', 'Explore the applications of machine learning in finance.', 1047, 75, 'Introduction to Programming, Data Science and Analytics'),
  (48, 'Virtual Reality', 'Learn the basics of creating virtual reality experiences.', 1048, 60, 'Introduction to Programming'),
  (49, 'Software Testing Automation', 'Explore automated testing techniques for software projects.', 1049, 75, 'Software Testing and Quality Assurance'),
  (50, 'Data Privacy and Security', 'An overview of data privacy laws and security measures.', 1050, 90, 'Cybersecurity Fundamentals');
 
 INSERT INTO Users (UserID, Name, ContactDetails, EducationalBackground, Username, Password)
VALUES
  (1001, 'John Smith', 'john@example.com', 'Bachelor of Science in Computer Science', 'johnsmith', 'password123'),
  (1002, 'Emily Johnson', 'emily@example.com', 'Master of Business Administration', 'emilyjohnson', 'qwerty456'),
  (1003, 'Michael Davis', 'michael@example.com', 'Bachelor of Arts in Psychology', 'michaeldavis', 'pass123word'),
  (1004, 'Sophia Anderson', 'sophia@example.com', 'Bachelor of Engineering in Mechanical Engineering', 'sophiaanderson', 'secure789'),
  (1005, 'Daniel Wilson', 'daniel@example.com', 'Master of Science in Data Science', 'danielwilson', 'letmein987'),
  (1006, 'Olivia Taylor', 'olivia@example.com', 'Bachelor of Commerce in Marketing', 'oliviataylor', 'hello123'),
  (1007, 'William Clark', 'william@example.com', 'Bachelor of Science in Biology', 'williamclark', 'password1'),
  (1008, 'Ava Martinez', 'ava@example.com', 'Bachelor of Arts in English Literature', 'avamartinez', 'abc123'),
  (1009, 'James Hernandez', 'james@example.com', 'Bachelor of Science in Computer Engineering', 'jameshernandez', 'test456'),
  (1010, 'Isabella Young', 'isabella@example.com', 'Bachelor of Science in Mathematics', 'isabellayoung', 'secretpass'),
  (1011, 'Liam Harris', 'liam@example.com', 'Bachelor of Science in Computer Science', 'liamharris', 'password789'),
  (1012, 'Mia Nelson', 'mia@example.com', 'Bachelor of Business Administration', 'mianelson', 'abc456'),
  (1013, 'Benjamin Carter', 'benjamin@example.com', 'Bachelor of Arts in Economics', 'benjamincarter', 'test123'),
  (1014, 'Evelyn Cooper', 'evelyn@example.com', 'Bachelor of Engineering in Civil Engineering', 'evelyncooper', 'pass456'),
  (1015, 'Alexander Murphy', 'alexander@example.com', 'Master of Science in Computer Science', 'alexandermurphy', 'welcome123'),
  (1016, 'Sofia Richardson', 'sofia@example.com', 'Bachelor of Arts in Sociology', 'sofiarichardson', 'securepass'),
  (1017, 'Henry Reed', 'henry@example.com', 'Bachelor of Science in Chemistry', 'henryreed', 'passme123'),
  (1018, 'Charlotte Stewart', 'charlotte@example.com', 'Bachelor of Arts in History', 'charlottestewart', 'testpass'),
  (1019, 'Sebastian Turner', 'sebastian@example.com', 'Bachelor of Science in Electrical Engineering', 'sebastianturner', 'password1234'),
  (1020, 'Scarlett Watson', 'scarlett@example.com', 'Bachelor of Science in Physics', 'scarlettwatson', 'letmein123'),
  (1021, 'Jacob Morgan', 'jacob@example.com', 'Bachelor of Arts in Political Science', 'jacobmorgan', 'test456pass'),
  (1022, 'Lily Bennett', 'lily@example.com', 'Bachelor of Science in Nursing', 'lilybennett', 'abc123xyz'),
  (1023, 'Williamson', 'williamson@example.com', 'Bachelor of Commerce in Accounting', 'williamson', 'secure789pass'),
  (1024, 'Liam Thompson', 'liamthompson@example.com', 'Bachelor of Arts in Anthropology', 'liamthompson', 'letmein789'),
  (1025, 'Harper Adams', 'harper@example.com', 'Bachelor of Science in Environmental Science', 'harperadams', 'testpass123'),
  (1026, 'Ethan Parker', 'ethan@example.com', 'Bachelor of Business Administration', 'ethanparker', 'password123456'),
  (1027, 'Amelia Wright', 'amelia@example.com', 'Bachelor of Science in Mathematics', 'ameliawright', 'abcxyz123'),
  (1028, 'Mason Hill', 'mason@example.com', 'Bachelor of Arts in English Literature', 'masonhill', 'secretpass123'),
  (1029, 'Ella Mitchell', 'ella@example.com', 'Bachelor of Science in Computer Engineering', 'ellamitchell', 'testpass789'),
  (1030, 'Jackson Rivera', 'jackson@example.com', 'Bachelor of Science in Biology', 'jacksonrivera', 'password987'),
  (1031, 'Avery Green', 'avery@example.com', 'Bachelor of Arts in Psychology', 'averygreen', 'hello456'),
  (1032, 'Scarlett Coleman', 'scarlettcoleman@example.com', 'Bachelor of Commerce in Marketing', 'scarlettcoleman', 'abc987'),
  (1033, 'Carter Morgan', 'carter@example.com', 'Bachelor of Science in Computer Science', 'cartermorgan', 'pass1234'),
  (1034, 'Grace Cooper', 'grace@example.com', 'Bachelor of Business Administration', 'gracecooper', 'qwerty123'),
  (1035, 'Lucas Stewart', 'lucas@example.com', 'Bachelor of Arts in Economics', 'lucasstewart', 'testpass456'),
  (1036, 'Penelope Turner', 'penelope@example.com', 'Bachelor of Engineering in Mechanical Engineering', 'penelopeturner', 'pass987'),
  (1037, 'Mateo Richardson', 'mateo@example.com', 'Master of Science in Data Science', 'mateorichardson', 'welcome789'),
  (1038, 'Aria Reed', 'aria@example.com', 'Bachelor of Arts in Sociology', 'ariareed', 'secure456'),
  (1039, 'Leo Carter', 'leo@example.com', 'Bachelor of Science in Chemistry', 'leocarter', 'passme456'),
  (1040, 'Stella Stewart', 'stella@example.com', 'Bachelor of Arts in History', 'stellastewart', 'testpass789'),
  (1041, 'Muhammad Turner', 'muhammad@example.com', 'Bachelor of Science in Electrical Engineering', 'muhammadturner', 'password12345'),
  (1042, 'Victoria Watson', 'victoria@example.com', 'Bachelor of Science in Physics', 'victoriawatson', 'letmein7890'),
  (1043, 'Dylan Morgan', 'dylan@example.com', 'Bachelor of Arts in Political Science', 'dylanmorgan', 'test123pass'),
  (1044, 'Zoe Bennett', 'zoe@example.com', 'Bachelor of Science in Nursing', 'zoebennett', 'abc123xyz789'),
  (1045, 'Mila Thompson', 'mila@example.com', 'Bachelor of Arts in Anthropology', 'milathompson', 'secure789pass123'),
  (1046, 'Liam Adams', 'liamadams@example.com', 'Bachelor of Science in Environmental Science', 'liamadams', 'letmein7890'),
  (1047, 'Emily Parker', 'emilyparker@example.com', 'Bachelor of Business Administration', 'emilyparker', 'password1234567'),
  (1048, 'Oliver Wright', 'oliverwright@example.com', 'Bachelor of Science in Mathematics', 'oliverwright', 'abcxyz123456'),
  (1049, 'Ava Hill', 'avahill@example.com', 'Bachelor of Arts in English Literature', 'avahill', 'secretpass123456'),
  (1050, 'Jacob Mitchell', 'jacobmitchell@example.com', 'Bachelor of Science in Computer Engineering', 'jacobmitchell', 'testpass789012'),
  (1051, 'Harper Rivera', 'harper@example.com', 'Bachelor of Science in Biology', 'harperrivera', 'hello987'),
  (1052, 'Evelyn Green', 'evelyn@example.com', 'Bachelor of Arts in Psychology', 'evelyngreen', 'pass12345'),
  (1053, 'Leo Coleman', 'leo@example.com', 'Bachelor of Engineering in Civil Engineering', 'leocoleman', 'abc123xyz789'),
  (1054, 'Scarlett Murphy', 'scarlett@example.com', 'Master of Science in Computer Science', 'scarlettmurphy', 'secure789pass123'),
  (1055, 'James Turner', 'james@example.com', 'Bachelor of Commerce in Marketing', 'jamesturner', 'letmein7890'),
  (1056, 'Avery Adams', 'avery@example.com', 'Bachelor of Science in Computer Science', 'averyadams', 'testpass789012'),
  (1057, 'Charlotte Stewart', 'charlotte@example.com', 'Bachelor of Business Administration', 'charlottestewart', 'password987'),
  (1058, 'Elijah Taylor', 'elijah@example.com', 'Bachelor of Arts in Economics', 'elijahtaylor', 'hello1234'),
  (1059, 'Amelia Nelson', 'amelia@example.com', 'Bachelor of Engineering in Mechanical Engineering', 'amelianelson', 'testpass7890123'),
  (1160, 'Benjamin Watson', 'benjamin@example.com', 'Master of Science in Data Science', 'benjaminwatson', 'abcxyz1234567'),
  (1061, 'Mia Reed', 'mia@example.com', 'Bachelor of Arts in Sociology', 'miareed', 'secretpass789012'),
  (1062, 'Sebastian Turner', 'sebastian@example.com', 'Bachelor of Science in Chemistry', 'sebastianturner', 'letmein9870'),
  (1063, 'Ava Clark', 'ava@example.com', 'Bachelor of Arts in History', 'avaclark', 'test123456pass'),
  (1064, 'Oliver Stewart', 'oliver@example.com', 'Bachelor of Science in Electrical Engineering', 'oliverstewart', 'abc123xyz789012'),
  (1065, 'Sophia Martinez', 'sophia@example.com', 'Bachelor of Science in Physics', 'sophiamartinez', 'secure789pass1234'),
  (1066, 'Henry Thompson', 'henry@example.com', 'Bachelor of Arts in Political Science', 'henrythompson', 'letmein7890123'),
  (1067, 'Luna Morgan', 'luna@example.com', 'Bachelor of Science in Nursing', 'lunamorgan', 'testpass1234567'),
  (1068, 'Ethan Turner', 'ethan@example.com', 'Bachelor of Arts in Anthropology', 'ethanturner', 'password987654'),
  (1069, 'Lily Adams', 'lily@example.com', 'Bachelor of Science in Environmental Science', 'lilyadams', 'hello98765'),
  (1070, 'Mason Green', 'mason@example.com', 'Bachelor of Business Administration', 'masongreen', 'testpass78901234'),
  (1071, 'Chloe Wright', 'chloe@example.com', 'Bachelor of Science in Mathematics', 'chloewright', 'abcxyz12345678'),
  (1072, 'Jackson Hill', 'jackson@example.com', 'Bachelor of Arts in English Literature', 'jacksonhill', 'secretpass1234567'),
  (1073, 'Grace Mitchell', 'grace@example.com', 'Bachelor of Science in Computer Engineering', 'gracemitchell', 'letmein78901234'),
  (1074, 'Lucas Rivera', 'lucas@example.com', 'Bachelor of Science in Biology', 'lucasrivera', 'password9876543'),
  (1075, 'Zoe Green', 'zoe@example.com', 'Bachelor of Arts in Psychology', 'zoegreen', 'hello12345'),
  (1076, 'Aria Coleman', 'aria@example.com', 'Bachelor of Engineering in Civil Engineering', 'ariacoleman', 'testpass789012345'),
  (1077, 'Jack Murphy', 'jack@example.com', 'Master of Science in Computer Science', 'jackmurphy', 'abcxyz123456789'),
  (1078, 'Penelope Turner', 'penelope@example.com', 'Bachelor of Commerce in Marketing', 'penelopeturner', 'secure789pass12345'),
  (1079, 'Matthew Adams', 'matthew@example.com', 'Bachelor of Science in Computer Science', 'matthewadams', 'letmein789012345'),
  (1080, 'Nova Clark', 'nova@example.com', 'Bachelor of Business Administration', 'novaclark', 'testpass789012345'),
  (1081, 'Henry Thompson', 'henry@example.com', 'Bachelor of Arts in Economics', 'henrythompson', 'password98765432'),
  (1082, 'Luna Nelson', 'luna@example.com', 'Bachelor of Engineering in Mechanical Engineering', 'lunanelson', 'hello1234567'),
  (1083, 'Elijah Watson', 'elijah@example.com', 'Master of Science in Data Science', 'elijahwatson', 'testpass7890123456'),
  (1084, 'Chloe Reed', 'chloe@example.com', 'Bachelor of Arts in Sociology', 'chloereed', 'abcxyz1234567890'),
  (1085, 'Leo Stewart', 'leo@example.com', 'Bachelor of Science in Chemistry', 'leostewart', 'secure789pass123456'),
  (1086, 'Lily Martinez', 'lily@example.com', 'Bachelor of Arts in History', 'lilymartinez', 'letmein98765432'),
  (1087, 'Mason Turner', 'mason@example.com', 'Bachelor of Science in Electrical Engineering', 'masonturner', 'test123456pass789'),
  (1088, 'Zoe Thompson', 'zoe@example.com', 'Bachelor of Science in Physics', 'zoethompson', 'abc123xyz789012345'),
  (1089, 'Aria Hill', 'aria@example.com', 'Bachelor of Arts in Political Science', 'ariahill', 'secretpass12345678'),
  (1090, 'Nova Mitchell', 'nova@example.com', 'Bachelor of Science in Nursing', 'novamitchell', 'hello9876543'),
  (1091, 'Matthew Rivera', 'matthew@example.com', 'Bachelor of Arts in Anthropology', 'matthewrivera', 'testpass78901234567'),
  (1092, 'Henry Green', 'henry@example.com', 'Bachelor of Science in Environmental Science', 'henrygreen', 'password987654321'),
  (1093, 'Luna Adams', 'luna@example.com', 'Bachelor of Business Administration', 'lunaadams', 'hello12345678'),
  (1094, 'Elijah Wright', 'elijah@example.com', 'Bachelor of Science in Mathematics', 'elijahwright', 'testpass789012345678'),
  (1095, 'Chloe Hill', 'chloe@example.com', 'Bachelor of Arts in English Literature', 'chloehill', 'abcxyz12345678901'),
  (1096, 'Leo Mitchell', 'leo@example.com', 'Bachelor of Science in Computer Engineering', 'leomitchell', 'secure789pass1234567'),
  (1097, 'Lily Rivera', 'lily@example.com', 'Bachelor of Science in Biology', 'lilyrivera', 'letmein789012345678'),
  (1098, 'Mason Green', 'mason@example.com', 'Bachelor of Arts in Psychology', 'masongreen', 'testpass789012345678'),
  (1099, 'Zoe Coleman', 'zoe@example.com', 'Bachelor of Engineering in Civil Engineering', 'zoecoleman', 'password987654321'),
  (1100, 'Aria Murphy', 'aria@example.com', 'Master of Science in Computer Science', 'ariamurphy', 'hello12345678');
  INSERT INTO Enrollment (EnrollmentID, UserID, CourseID, EnrollmentDate)
VALUES
  (101, 1051, 1, '2023-01-15'),
  (102, 1052, 2, '2023-02-20'),
  (103, 1053, 3, '2023-03-10'),
  (104, 1054, 4, '2023-04-05'),
  (105, 1055, 5, '2023-05-12'),
  (106, 1056, 6, '2023-06-25'),
  (107, 1057, 7, '2023-07-18'),
  (108, 1058, 8, '2023-08-07'),
  (109, 1059, 9, '2023-09-22'),
  (110, 1160, 10, '2023-10-11'),
  (111, 1061, 11, '2023-11-30'),
  (112, 1062, 12, '2023-12-19'),
  (113, 1063, 13, '2023-01-05'),
  (114, 1064, 14, '2023-02-08'),
  (115, 1065, 15, '2023-03-16'),
  (116, 1066, 16, '2023-04-28'),
  (117, 1067, 17, '2023-05-05'),
  (118, 1068, 18, '2023-06-08'),
  (119, 1069, 19, '2023-07-21'),
  (120, 1070, 20, '2023-08-14'),
  (121, 1071, 21, '2023-09-29'),
  (122, 1072, 22, '2023-10-18'),
  (123, 1073, 23, '2023-11-24'),
  (124, 1074, 24, '2023-12-10'),
  (125, 1075, 25, '2023-01-08'),
  (126, 1076, 26, '2023-02-16'),
  (127, 1077, 27, '2023-03-25'),
  (128, 1078, 28, '2023-04-30'),
  (129, 1079, 29, '2023-05-18'),
  (130, 1080, 30, '2023-06-27'),
  (131, 1081, 31, '2023-07-10'),
  (132, 1082, 32, '2023-08-02'),
  (133, 1083, 33, '2023-09-17'),
  (134, 1084, 34, '2023-10-26'),
  (135, 1085, 35, '2023-11-12'),
  (136, 1086, 36, '2023-12-05'),
  (137, 1087, 37, '2023-01-19'),
  (138, 1088, 38, '2023-02-22'),
  (139, 1089, 39, '2023-03-07'),
  (140, 1090, 40, '2023-04-16'),
  (141, 1091, 41, '2023-05-27'),
  (142, 1092, 42, '2023-06-14'),
  (143, 1093, 43, '2023-07-09'),
  (144, 1094, 44, '2023-08-28'),
  (145, 1095, 45, '2023-09-04'),
  (146, 1096, 46, '2023-10-07'),
  (147, 1097, 47, '2023-11-14'),
  (148, 1098, 48, '2023-12-01'),
  (149, 1099, 49, '2023-01-24'),
  (150, 1100, 50, '2023-02-11');
INSERT INTO Progress (ProgressID, EnrollmentID, CompletedModules, QuizzesCompleted, AssignmentsCompleted, OverallCourseCompletionStatus)
VALUES
  (201, 101, 6, 4, 3, 'In Progress'),
  (202, 102, 9, 7, 5, 'Completed'),
  (203, 103, 5, 3, 2, 'In Progress'),
  (204, 104, 8, 6, 4, 'Completed'),
  (205, 105, 2, 1, 0, 'Not Started'),
  (206, 106, 4, 2, 1, 'In Progress'),
  (207, 107, 7, 5, 3, 'Completed'),
  (208, 108, 3, 2, 1, 'In Progress'),
  (209, 109, 6, 4, 2, 'In Progress'),
  (210, 110, 5, 3, 2, 'In Progress'),
  (211, 111, 9, 7, 6, 'Completed'),
  (212, 112, 6, 4, 3, 'In Progress'),
  (213, 113, 4, 3, 2, 'In Progress'),
  (214, 114, 7, 5, 4, 'Completed'),
  (215, 115, 3, 2, 1, 'In Progress'),
  (216, 116, 8, 6, 3, 'Completed'),
  (217, 117, 5, 3, 2, 'In Progress'),
  (218, 118, 2, 1, 0, 'Not Started'),
  (219, 119, 4, 2, 1, 'In Progress'),
  (220, 120, 7, 5, 3, 'Completed'),
  (221, 121, 3, 2, 1, 'In Progress'),
  (222, 122, 6, 4, 2, 'In Progress'),
  (223, 123, 5, 3, 2, 'In Progress'),
  (224, 124, 9, 7, 6, 'Completed'),
  (225, 125, 6, 4, 3, 'In Progress'),
  (226, 126, 4, 3, 2, 'In Progress'),
  (227, 127, 7, 5, 4, 'Completed'),
  (228, 128, 3, 2, 1, 'In Progress'),
  (229, 129, 8, 6, 3, 'Completed'),
  (230, 130, 5, 3, 2, 'In Progress'),
  (231, 131, 2, 1, 0, 'Not Started'),
  (232, 132, 4, 2, 1, 'In Progress'),
  (233, 133, 7, 5, 3, 'Completed'),
  (234, 134, 3, 2, 1, 'In Progress'),
  (235, 135, 6, 4, 2, 'In Progress'),
  (236, 136, 5, 3, 2, 'In Progress'),
  (237, 137, 9, 7, 6, 'Completed'),
  (238, 138, 6, 4, 3, 'In Progress'),
  (239, 139, 4, 3, 2, 'In Progress'),
  (240, 140, 7, 5, 4, 'Completed'),
  (241, 141, 3, 2, 1, 'In Progress'),
  (242, 142, 8, 6, 3, 'Completed'),
  (243, 143, 5, 3, 2, 'In Progress'),
  (244, 144, 2, 1, 0, 'Not Started'),
  (245, 145, 4, 2, 1, 'In Progress'),
  (246, 146, 7, 5, 3, 'Completed'),
  (247, 147, 3, 2, 1, 'In Progress'),
  (248, 148, 6, 4, 2, 'In Progress'),
  (249, 149, 5, 3, 2, 'In Progress'),
  (250, 150, 9, 7, 6, 'Completed');
INSERT INTO CourseContent (ContentID, CourseID, ModuleTitle, LessonMaterials, LectureVideos, Quizzes, Assignments)
VALUES
  (301, 10, 'Introduction to Computer Science', 'Computer Science Basics guide', 'https://lectures.com/cs-intro', 'https://quizzes.com/cs-intro', 'https://assignments.com/cs-intro'),
  (302, 10, 'Algorithms and Data Structures', 'Algorithms and Data Structures textbook', 'https://lectures.com/algorithms-ds', 'https://quizzes.com/algorithms-ds', 'https://assignments.com/algorithms-ds'),
  (303, 10, 'Database Management Systems', 'Database Management Systems guide', 'https://lectures.com/dbms', 'https://quizzes.com/dbms', 'https://assignments.com/dbms'),
  (304, 12, 'Introduction to Psychology', 'Psychology Basics guide', 'https://lectures.com/psychology-intro', 'https://quizzes.com/psychology-intro', 'https://assignments.com/psychology-intro'),
  (305, 12, 'Cognitive Psychology', 'Cognitive Psychology textbook', 'https://lectures.com/cognitive-psychology', 'https://quizzes.com/cognitive-psychology', 'https://assignments.com/cognitive-psychology'),
  (306, 14, 'Introduction to Economics', 'Economics Basics guide', 'https://lectures.com/economics-intro', 'https://quizzes.com/economics-intro', 'https://assignments.com/economics-intro'),
  (307, 14, 'Macroeconomics', 'Macroeconomics textbook', 'https://lectures.com/macroeconomics', 'https://quizzes.com/macroeconomics', 'https://assignments.com/macroeconomics'),
  (308, 14, 'Microeconomics', 'Microeconomics textbook', 'https://lectures.com/microeconomics', 'https://quizzes.com/microeconomics', 'https://assignments.com/microeconomics'),
  (309, 16, 'Introduction to Literature', 'Literature Basics guide', 'https://lectures.com/literature-intro', 'https://quizzes.com/literature-intro', 'https://assignments.com/literature-intro'),
  (310, 16, 'American Literature', 'American Literature textbook', 'https://lectures.com/american-literature', 'https://quizzes.com/american-literature', 'https://assignments.com/american-literature'),
  (311, 16, 'British Literature', 'British Literature textbook', 'https://lectures.com/british-literature', 'https://quizzes.com/british-literature', 'https://assignments.com/british-literature'),
  (312, 18, 'Introduction to Web Development', 'Web Development Basics guide', 'https://lectures.com/web-dev-intro', 'https://quizzes.com/web-dev-intro', 'https://assignments.com/web-dev-intro'),
  (313, 18, 'HTML and CSS Fundamentals', 'HTML and CSS Fundamentals textbook', 'https://lectures.com/html-css-fundamentals', 'https://quizzes.com/html-css-fundamentals', 'https://assignments.com/html-css-fundamentals'),
  (314, 18, 'Responsive Web Design', 'Responsive Web Design guide', 'https://lectures.com/responsive-web-design', 'https://quizzes.com/responsive-web-design', 'https://assignments.com/responsive-web-design'),
  (315, 20, 'Introduction to Sociology', 'Sociology Basics guide', 'https://lectures.com/sociology-intro', 'https://quizzes.com/sociology-intro', 'https://assignments.com/sociology-intro'),
  (316, 20, 'Social Movements', 'Social Movements textbook', 'https://lectures.com/social-movements', 'https://quizzes.com/social-movements', 'https://assignments.com/social-movements'),
  (317, 20, 'Cultural Anthropology', 'Cultural Anthropology guide', 'https://lectures.com/cultural-anthropology', 'https://quizzes.com/cultural-anthropology', 'https://assignments.com/cultural-anthropology'),
  (318, 22, 'Introduction to Chemistry', 'Chemistry Basics guide', 'https://lectures.com/chemistry-intro', 'https://quizzes.com/chemistry-intro', 'https://assignments.com/chemistry-intro'),
  (319, 22, 'Organic Chemistry', 'Organic Chemistry textbook', 'https://lectures.com/organic-chemistry', 'https://quizzes.com/organic-chemistry', 'https://assignments.com/organic-chemistry'),
  (320, 24, 'Introduction to Physics', 'Physics Basics guide', 'https://lectures.com/physics-intro', 'https://quizzes.com/physics-intro', 'https://assignments.com/physics-intro'),
  (321, 24, 'Classical Mechanics', 'Classical Mechanics textbook', 'https://lectures.com/classical-mechanics', 'https://quizzes.com/classical-mechanics', 'https://assignments.com/classical-mechanics'),
  (322, 24, 'Electromagnetism', 'Electromagnetism guide', 'https://lectures.com/electromagnetism', 'https://quizzes.com/electromagnetism', 'https://assignments.com/electromagnetism'),
  (323, 26, 'Introduction to Marketing', 'Marketing Basics guide', 'https://lectures.com/marketing-intro', 'https://quizzes.com/marketing-intro', 'https://assignments.com/marketing-intro'),
  (324, 26, 'Digital Marketing', 'Digital Marketing textbook', 'https://lectures.com/digital-marketing', 'https://quizzes.com/digital-marketing', 'https://assignments.com/digital-marketing'),
  (325, 26, 'Consumer Behavior', 'Consumer Behavior guide', 'https://lectures.com/consumer-behavior', 'https://quizzes.com/consumer-behavior', 'https://assignments.com/consumer-behavior'),
  (326, 28, 'Introduction to Art History', 'Art History Basics guide', 'https://lectures.com/art-history-intro', 'https://quizzes.com/art-history-intro', 'https://assignments.com/art-history-intro'),
  (327, 28, 'Renaissance Art', 'Renaissance Art textbook', 'https://lectures.com/renaissance-art', 'https://quizzes.com/renaissance-art', 'https://assignments.com/renaissance-art'),
  (328, 28, 'Modern Art', 'Modern Art guide', 'https://lectures.com/modern-art', 'https://quizzes.com/modern-art', 'https://assignments.com/modern-art'),
  (329, 30, 'Introduction to Music Theory', 'Music Theory Basics guide', 'https://lectures.com/music-theory-intro', 'https://quizzes.com/music-theory-intro', 'https://assignments.com/music-theory-intro'),
  (330, 30, 'Classical Music', 'Classical Music textbook', 'https://lectures.com/classical-music', 'https://quizzes.com/classical-music', 'https://assignments.com/classical-music'),
  (331, 32, 'Introduction to World History', 'World History Basics guide', 'https://lectures.com/world-history-intro', 'https://quizzes.com/world-history-intro', 'https://assignments.com/world-history-intro'),
  (332, 32, 'Ancient Civilizations', 'Ancient Civilizations textbook', 'https://lectures.com/ancient-civilizations', 'https://quizzes.com/ancient-civilizations', 'https://assignments.com/ancient-civilizations'),
  (333, 32, 'Modern World History', 'Modern World History guide', 'https://lectures.com/modern-world-history', 'https://quizzes.com/modern-world-history', 'https://assignments.com/modern-world-history'),
  (334, 34, 'Introduction to Political Science', 'Political Science Basics guide', 'https://lectures.com/political-science-intro', 'https://quizzes.com/political-science-intro', 'https://assignments.com/political-science-intro'),
  (335, 34, 'International Relations', 'International Relations textbook', 'https://lectures.com/international-relations', 'https://quizzes.com/international-relations', 'https://assignments.com/international-relations'),
  (336, 34, 'Comparative Politics', 'Comparative Politics guide', 'https://lectures.com/comparative-politics', 'https://quizzes.com/comparative-politics', 'https://assignments.com/comparative-politics'),
  (337, 36, 'Introduction to Environmental Science', 'Environmental Science Basics guide', 'https://lectures.com/environmental-science-intro', 'https://quizzes.com/environmental-science-intro', 'https://assignments.com/environmental-science-intro'),
  (338, 36, 'Ecology', 'Ecology textbook', 'https://lectures.com/ecology', 'https://quizzes.com/ecology', 'https://assignments.com/ecology'),
  (339, 36, 'Climate Change', 'Climate Change guide', 'https://lectures.com/climate-change', 'https://quizzes.com/climate-change', 'https://assignments.com/climate-change'),
  (340, 38, 'Introduction to Astronomy', 'Astronomy Basics guide', 'https://lectures.com/astronomy-intro', 'https://quizzes.com/astronomy-intro', 'https://assignments.com/astronomy-intro'),
  (341, 38, 'Astrophysics', 'Astrophysics textbook', 'https://lectures.com/astrophysics', 'https://quizzes.com/astrophysics', 'https://assignments.com/astrophysics'),
  (342, 38, 'Cosmology', 'Cosmology guide', 'https://lectures.com/cosmology', 'https://quizzes.com/cosmology', 'https://assignments.com/cosmology'),
  (343, 40, 'Introduction to Philosophy', 'Philosophy Basics guide', 'https://lectures.com/philosophy-intro', 'https://quizzes.com/philosophy-intro', 'https://assignments.com/philosophy-intro'),
  (344, 40, 'Ethics', 'Ethics textbook', 'https://lectures.com/ethics', 'https://quizzes.com/ethics', 'https://assignments.com/ethics'),
  (345, 40, 'Logic', 'Logic guide', 'https://lectures.com/logic', 'https://quizzes.com/logic', 'https://assignments.com/logic'),
  (346, 42, 'Introduction to Foreign Languages', 'Foreign Languages Basics guide', 'https://lectures.com/foreign-languages-intro', 'https://quizzes.com/foreign-languages-intro', 'https://assignments.com/foreign-languages-intro'),
  (347, 42, 'Spanish', 'Spanish textbook', 'https://lectures.com/spanish', 'https://quizzes.com/spanish', 'https://assignments.com/spanish'),
  (348, 42, 'French', 'French textbook', 'https://lectures.com/french', 'https://quizzes.com/french', 'https://assignments.com/french'),
  (349, 44, 'Introduction to Health and Fitness', 'Health and Fitness Basics guide', 'https://lectures.com/health-fitness-intro', 'https://quizzes.com/health-fitness-intro', 'https://assignments.com/health-fitness-intro'),
  (350, 44, 'Nutrition and Diet', 'Nutrition and Diet guide', 'https://lectures.com/nutrition-diet', 'https://quizzes.com/nutrition-diet', 'https://assignments.com/nutrition-diet');

  -- Data For DiscussionForums
INSERT INTO DiscussionForum (ForumID, CourseID, UserID, PostTitle, PostContent, PostDate)
VALUES
  (401, 1, 1001, 'First Post', 'I''m excited to start this course! Looking forward to learning new concepts and expanding my knowledge.', '2023-06-01'),
  (402, 1, 1002, 'Second Post', 'Has anyone completed the first module? I found it quite challenging but interesting.', '2023-06-01'),
  (403, 2, 1003, 'Third Post', 'The course materials are well-structured and the instructor explains concepts clearly. Enjoying the learning process so far.', '2023-06-03'),
  (404, 2, 1004, 'Fourth Post', 'I have a question regarding the assignment for Module 2. Can someone provide some guidance?', '2023-06-04'),
  (405, 3, 1001, 'Fifth Post', 'Just finished watching the lecture videos for Module 3. The content is informative and thought-provoking.', '2023-06-05'),
  (406, 3, 1002, 'Sixth Post', 'The discussion forums are a great way to interact with fellow learners. Looking forward to engaging in meaningful discussions.', '2023-06-06'),
  (407, 1, 1003, 'Seventh Post', 'I have found the quizzes quite challenging but they help reinforce the concepts. Don''t forget to attempt them!', '2023-06-07'),
  (408, 2, 1004, 'Eighth Post', 'The course duration is just perfect. It allows ample time to grasp the concepts without rushing through the content.', '2023-06-08'),
  (409, 3, 1001, 'Ninth Post', 'The instructor provides timely feedback on assignments, which is immensely helpful in the learning process.', '2023-06-09'),
  (410, 1, 1002, 'Tenth Post', 'I appreciate the inclusion of real-life examples in the course materials. It makes the content more relatable.', '2023-06-10'),
(411, 1, 1001, 'eleven Post', 'I just started the course and i learned alot', '2023-06-01'),
  (412, 1, 1002, 'twelve Post', 'The course materials are well-structured and easy to follow.', '2023-06-02'),
  (413, 1, 1003, 'Thirteen Post', 'I have a question about the first assignment. Can someone assist?', '2023-06-03'),
  (414, 1, 1004, 'Fourtheen Post', 'The discussion forums are a great place to interact with fellow learners.', '2023-06-04'),
  (415, 2, 1001, 'Fiftheen Post', 'I found the lecture videos to be informative and engaging.', '2023-06-05'),
  (416, 2, 1002, 'Sixteen Post', 'The course quizzes are helping me assess my understanding of the topics.', '2023-06-06'),
  (417, 2, 1003, 'Seventeen Post', 'I just completed Module 3 and it was very insightful.', '2023-06-07'),
  (418, 2, 1004, 'Eighteen Post', 'The course instructor provides prompt responses to questions.', '2023-06-08'),
  (419, 3, 1001, 'Ninteen Post', 'I appreciate the practical exercises that accompany each module.', '2023-06-09'),
  (420, 3, 1002, 'Tweenty Post', 'The course content is relevant and up-to-date.', '2023-06-10'),
  (421, 3, 1003, 'Tweenty-one Post', 'The assignments are challenging but rewarding.', '2023-06-11'),
  (422, 3, 1004, 'Tweenty-two Post', 'The course has exceeded my expectations so far.', '2023-06-12'),
  (423, 1, 1001, 'Tweenty-three Post', 'I just finished the course and i love this', '2023-06-13'),
  (424, 1, 1002, 'Tweenty-four Post', 'I just finished the course and i love this course and the way of teaching', '2023-06-14'),
  (425, 1, 1003, 'Tweenty-five Post', 'The course materials were comprehensive and well-organized.', '2023-06-15'),
  (426, 1, 1004, 'Tweenty-six Post', 'I highly recommend this course to others.', '2023-06-16'),
  (427, 2, 1001, 'Tweenty-seven Post', 'The course forum discussions are insightful and thought-provoking.', '2023-06-17'),
  (428, 2, 1002, 'Tweenty-eight Post', 'I halfway through the course, and I can already see the practical applications of what I learned.', '2023-06-18'),
  (429, 2, 1003, 'Tweenty-nine Post', 'The course instructor is highly knowledgeable and provides in-depth explanations.', '2023-06-19'),
  (430, 2, 1003, 'Thirty Post', 'The course instructor is highly knowledgeable and very corporative.', '2023-07-20'),
  (431, 3, 1001, 'Twenty-First Post', 'I m impressed with the real-world examples used in the course content.', '2023-06-21'),
  (432, 3, 1002, 'Twenty-Second Post', 'The course has a good balance of theory and practical exercises.', '2023-06-22'),
  (433, 3, 1003, 'Twenty-Third Post', 'I m looking forward to the upcoming guest lecture in Module 5.', '2023-06-23'),
  (434, 3, 1004, 'Twenty-Fourth Post', 'The course has helped me gain a deeper understanding of the subject.', '2023-06-24'),
  (435, 4, 1001, 'Twenty-Fifth Post', 'I appreciate the interactive discussions in the course forum.', '2023-06-25'),
  (436, 4, 1002, 'Twenty-Sixth Post', 'The course materials are well-structured and easy to follow.', '2023-06-26'),
  (437, 4, 1003, 'Twenty-Seventh Post', 'The assignments are challenging but rewarding.', '2023-06-27'),
  (438, 4, 1004, 'Twenty-Eighth Post', 'The course instructor provides timely feedback on assignments.', '2023-06-28'),
  (439, 5, 1001, 'Twenty-Ninth Post', 'The course has exceeded my expectations in terms of content quality.', '2023-06-29'),
  (440, 5, 1002, 'Thirtieth Post', 'I m impressed with the depth of knowledge shared by the instructor.', '2023-06-30'),
  (441, 5, 1003, 'Thirty-First Post', 'The course has boosted my confidence in the subject matter.', '2023-07-01'),
  (442, 5, 1004, 'Thirty-Second Post', 'The course has practical examples that facilitate understanding.', '2023-07-02'),
  (443, 6, 1001, 'Thirty-Third Post', 'The course has a good balance of theory and hands-on exercises.', '2023-07-03'),
  (444, 6, 1002, 'Thirty-Fourth Post', 'The course forum is a great place to connect with fellow learners.', '2023-07-04'),
  (445, 6, 1003, 'Thirty-Fifth Post', 'I m impressed with the quality of the course videos.', '2023-07-05'),
  (446, 6, 1004, 'Thirty-Sixth Post', 'The course content is up-to-date and relevant to industry trends.', '2023-07-06'),
  (447, 7, 1001, 'Thirty-Seventh Post', 'The course exercises have improved my practical skills.', '2023-07-07'),
  (448, 7, 1002, 'Thirty-Eighth Post', 'The course forum discussions have provided additional insights.', '2023-07-08'),
  (449, 7, 1003, 'Thirty-Ninth Post', 'The course has a good mix of theoretical concepts and real-world applications.', '2023-07-09'),
  (450, 7, 1004, 'Fortieth Post', 'I m glad I enrolled in this course. It has expanded my knowledge.', '2023-07-10');



-- Data For PostComments Table
INSERT INTO PostComments (CommentID, ForumID, UserID, CommentContent, CommentDate)
VALUES
  (1, 401, 1001, 'Great post! I completely agree with you.', '2023-06-01'),
  (2, 401, 1002, 'I had a similar experience. Thanks for sharing!', '2023-06-02'),
  (3, 402, 1003, 'Well explained. I appreciate the detailed response.', '2023-06-03'),
  (4, 402, 1004, 'I facing the same issue. Can anyone help us?', '2023-06-04'),
  (5, 403, 1001, 'I found that part interesting too. Good observation!', '2023-06-05'),
  (6, 403, 1002, 'I agree, the discussions here are insightful.', '2023-06-06'),
  (7, 401, 1003, 'You  right, the quizzes are challenging but beneficial.', '2023-06-07'),
  (8, 402, 1004, 'I m glad the course duration is suitable for you.', '2023-06-08'),
  (9, 403, 1001, 'I received valuable feedback as well. It helps a lot.', '2023-06-09'),
  (10, 401, 1002, 'The real-life examples make the course more engaging.', '2023-06-10'),
  (11, 401, 1001, 'I am excited to join this discussion. What are your thoughts?', '2023-06-11'),
  (12, 401, 1003, 'I can provide some assistance. What do you need help with?', '2023-06-12'),
  (13, 402, 1002, 'I just completed Module 3 too. It was enlightening!', '2023-06-13'),
  (14, 402, 1003, 'The instructor s explanations are top-notch.', '2023-06-14'),
  (15, 403, 1004, 'I agree that the practical exercises enhance the learning experience.', '2023-06-15'),
  (16, 403, 1001, 'I am looking forward to the guest lecture as well.', '2023-06-16'),
  (17, 404, 1002, 'The course forum discussions are beneficial for everyone.', '2023-06-17'),
  (18, 404, 1003, 'I can already see the practical applications too. It is great!', '2023-06-18'),
  (19, 405, 1004, 'The course instructor is knowledgeable and supportive.', '2023-06-19'),
  (20, 405, 1001, 'The course has exceeded my expectations. I am impressed.', '2023-06-20'),
  (21, 401, 1002, 'I appreciate your insights. Well said!', '2023-06-21'),
  (22, 401, 1003, 'I found the first assignment challenging too. Let us discuss!', '2023-06-22'),
  (23, 402, 1004, 'The forum is a great platform for exchanging ideas ', '2023-06-23'),
  (24, 402, 1001, 'I am glad you found the lecture videos informative.', '2023-06-24'),
  (25, 403, 1002, 'The quizzes help assess our understanding. Keep it up!', '2023-06-25'),
  (26, 403, 1003, 'Module 3 had some eye-opening concepts, did it?', '2023-06-26'),
  (27, 404, 1001, 'The instructor is prompt responses are highly appreciated.', '2023-06-27'),
  (28, 404, 1002, 'I am glad the course duration allows thorough learning.', '2023-06-28'),
  (29, 405, 1003, 'Practical exercises make the course more engaging.', '2023-06-29'),
  (30, 405, 1004, 'Real-world examples help connect theory with practice.', '2023-06-30'),
  (31, 406, 1001, 'The course strikes a perfect balance. I am enjoying it.', '2023-07-01'),
  (32, 406, 1002, 'The course forum discussions broaden my perspectives.', '2023-07-02'),
  (33, 407, 1003, 'The course videos are of high quality. Impressive!', '2023-07-03'),
  (34, 407, 1004, 'The course content is aligned with industry trends.', '2023-07-04'),
  (35, 408, 1001, 'The practical exercises sharpen our skills effectively.', '2023-07-05'),
  (36, 408, 1002, 'The course forum discussions provide valuable insights.', '2023-07-06'),
  (37, 409, 1003, 'The course offers a perfect blend of theory and practice.', '2023-07-07'),
  (38, 409, 1004, 'I am grateful for this course. It expanded my knowledge.', '2023-07-08'),
  (39, 410, 1001, 'The course material is comprehensive and well-structured.', '2023-07-09'),
  (40, 410, 1002, 'I highly recommend this course to anyone interested.', '2023-07-10'),
  (41, 401, 1003, 'I completely agree with your point of view.', '2023-07-11'),
  (42, 402, 1004, 'The course assignments are well-designed and challenging.', '2023-07-12'),
  (43, 403, 1001, 'I found the guest lecture in Module 5 inspiring.', '2023-07-13'),
  (44, 404, 1002, 'The course feedback has been valuable for my growth.', '2023-07-14'),
  (45, 405, 1003, 'The course content is relevant to current industry needs.', '2023-07-15'),
  (46, 406, 1004, 'I am impressed with the course is practical approach.', '2023-07-16'),
  (47, 407, 1001, 'The course forum is a great place to seek clarifications.', '2023-07-17'),
  (48, 408, 1002, 'The course quizzes challenge my understanding effectively.', '2023-07-18'),
  (49, 409, 1003, 'The course materials are comprehensive and easy to follow.', '2023-07-19'),
  (50, 410, 1004, 'I appreciate the real-life examples shared in the course.', '2023-07-20');


-- Data For Grading table
INSERT INTO Grading (GradingID, EnrollmentID, AssignmentID, Grade, Feedback)
VALUES
  (1, 101, 301, 95, 'Great work! Your assignment demonstrates a clear understanding of the concepts.'),
  (2, 101, 302, 85, 'Good effort! You have addressed most of the requirements.'),
  (3, 102, 301, 92, 'Excellent job! Your assignment shows a strong grasp of the material.'),
  (4, 102, 302, 78, 'Decent work. Make sure to provide more detailed explanations in the future.'),
  (5, 103, 301, 88, 'Well done! Your assignment displays a good understanding of the topic.'),
  (6, 103, 302, 90, 'Very good work! You have presented your ideas effectively.'),
  (7, 104, 301, 76, 'Fair effort. Pay closer attention to the requirements next time.'),
  (8, 104, 302, 82, 'Good attempt! Make sure to provide more examples to support your arguments.'),
  (9, 105, 301, 95, 'Outstanding work! Your assignment showcases a deep understanding of the subject matter.'),
  (10, 105, 302, 88, 'Great job! Your analysis is thorough and well-supported.'),
  (11, 106, 301, 80, 'Satisfactory work. Review the guidelines for better structure and organization.'),
  (12, 106, 302, 92, 'Excellent effort! Your assignment demonstrates critical thinking and analysis.'),
  (13, 107, 301, 85, 'Good work! Your assignment shows a solid understanding of the material.'),
  (14, 107, 302, 78, 'Decent attempt. Try to provide more in-depth explanations.'),
  (15, 108, 301, 90, 'Very well done! Your assignment is insightful and well-reasoned.'),
  (16, 108, 302, 92, 'Impressive work! Your analysis is comprehensive and supported by strong evidence.'),
  (17, 109, 301, 86, 'Well executed! Your assignment reflects a good grasp of the concepts.'),
  (18, 109, 302, 80, 'Adequate effort. Include more examples to strengthen your arguments.'),
  (19, 101, 301, 95, 'Exceptional work! Your assignment showcases a high level of understanding and creativity.'),
  (20, 110, 302, 92, 'Very impressive! Your analysis is well-structured and supported by relevant data.'),
  (21, 110, 301, 85, 'Good effort! Your assignment demonstrates a solid understanding of the concepts.'),
  (22, 110, 302, 90, 'Well done! You have provided well-reasoned arguments.'),
  (23, 102, 301, 92, 'Excellent work! Your assignment shows a deep understanding of the topic.'),
  (24, 120, 302, 78, 'Decent attempt. Make sure to provide more supporting evidence.'),
  (25, 130, 301, 88, 'Great job! Your assignment displays critical thinking and analysis.'),
  (26, 130, 302, 90, 'Very good work! Your ideas are well-presented and supported.'),
  (27, 140, 301, 76, 'Fair effort. Ensure to review the guidelines for better organization.'),
  (28, 140, 302, 82, 'Good attempt! Expand on your explanations for a more comprehensive analysis.'),
  (29, 150, 301, 95, 'Outstanding work! Your assignment demonstrates exceptional insight.'),
  (30, 150, 302, 88, 'Great job! Your analysis is thorough and well-supported.'),
  (31, 106, 301, 80, 'Satisfactory work. Focus on improving the clarity of your arguments.'),
  (32, 106, 302, 92, 'Excellent effort! Your assignment showcases strong critical thinking skills.'),
  (33, 107, 301, 85, 'Good work! Your assignment shows a solid understanding of the material.'),
  (34, 107, 302, 78, 'Decent attempt. Provide more examples to strengthen your analysis.'),
  (35, 108, 301, 90, 'Very well done! Your assignment demonstrates thoughtful insights.'),
  (36, 108, 302, 92, 'Impressive work! Your analysis is comprehensive and well-supported.'),
  (37, 109, 301, 86, 'Well executed! Your assignment reflects a good understanding of the concepts.'),
  (38, 109, 302, 80, 'Adequate effort. Include more supporting evidence for a stronger analysis.'),
  (39, 120, 301, 95, 'Exceptional work! Your assignment showcases a high level of understanding and creativity.'),
  (40, 120, 302, 92, 'Very impressive! Your analysis is well-structured and supported.'),
  (41, 121, 301, 85, 'Good effort! Your assignment demonstrates a solid understanding of the concepts.'),
  (42, 121, 302, 90, 'Well done! You have provided well-reasoned arguments.'),
  (43, 122, 301, 92, 'Excellent work! Your assignment shows a deep understanding of the topic.'),
  (44, 122, 302, 78, 'Decent attempt. Make sure to provide more supporting evidence.'),
  (45, 123, 301, 88, 'Great job! Your assignment displays critical thinking and analysis.'),
  (46, 123, 302, 90, 'Very good work! Your ideas are well-presented and supported.'),
  (47, 124, 301, 76, 'Fair effort. Ensure to review the guidelines for better organization.'),
  (48, 124, 302, 82, 'Good attempt! Expand on your explanations for a more comprehensive analysis.'),
  (49, 125, 301, 95, 'Outstanding work! Your assignment demonstrates exceptional insight.'),
  (50, 125, 302, 88, 'Great job! Your analysis is thorough and well-supported.');



-- Data For Notification Table
INSERT INTO Notifications (NotificationID, UserID, NotificationContent, NotificationDate)
VALUES
  (1, 1001, 'New course material uploaded. Check it out!', '2023-06-01'),
  (2, 1002, 'Reminder: Assignment deadline approaching tomorrow.', '2023-06-01'),
  (3, 1003, 'Congratulations! You have completed Module 1.', '2023-06-03'),
  (4, 1004, 'Important announcement: Guest lecture scheduled next week.', '2023-06-04'),
  (5, 1001, 'Reminder: Quiz due by end of the day.', '2023-06-05'),
  (6, 1002, 'New forum post: Join the discussion on Module 2.', '2023-06-06'),
  (7, 1003, 'Feedback provided on your recent assignment submission.', '2023-06-07'),
  (8, 1004, 'Course evaluation survey now available. Share your feedback!', '2023-06-08'),
  (9, 1001, 'Reminder: Final project proposal submission deadline tomorrow.', '2023-06-09'),
  (10, 1002, 'New course announcement: Advanced topic workshop next month.', '2023-06-10'),
  (11, 1003, 'Important update: Change in office hours for the instructor.', '2023-06-11'),
  (12, 1004, 'Discussion forum guidelines updated. Please review.', '2023-06-12'),
  (13, 1001, 'Reminder: Guest lecture tomorrow on emerging trends.', '2023-06-13'),
  (14, 1002, 'New resource added to the course materials section.', '2023-06-14'),
  (15, 1003, 'Announcement: Course completion certificates now available.', '2023-06-15'),
  (16, 1004, 'Reminder: Midterm exam scheduled next week.', '2023-06-16'),
  (17, 1001, 'New course module unlocked. Explore new content!', '2023-06-17'),
  (18, 1002, 'Feedback provided on your forum post.', '2023-06-18'),
  (19, 1003, 'Important update: Change in the course schedule.', '2023-06-19'),
  (20, 1004, 'Reminder: Group project submission due next week.', '2023-06-20'),
  (21, 1001, 'New course announcement: Webinar on industry applications.', '2023-06-21'),
  (22, 1002, 'Reminder: Peer review for assignments starts tomorrow.', '2023-06-22'),
  (23, 1003, 'Discussion forum moderation guidelines updated.', '2023-06-23'),
  (24, 1004, 'Feedback provided on your quiz performance.', '2023-06-24'),
  (25, 1001, 'New course resource: Supplementary reading materials.', '2023-06-25'),
  (26, 1002, 'Reminder: Final project progress report due next week.', '2023-06-26'),
  (27, 1003, 'Discussion forum post selected as a featured contribution.', '2023-06-27'),
  (28, 1004, 'Important update: Change in the course grading policy.', '2023-06-28'),
  (29, 1001, 'Reminder: Course feedback survey closing soon. Share your thoughts!', '2023-06-29'),
  (30, 1002, 'New course announcement: Guest speaker session tomorrow.', '2023-06-30'),
  (31, 1002, 'Reminder: Course survey feedback requested.', '2023-07-01'),
  (32, 1003, 'New course material added to Module 4.', '2023-07-02'),
  (33, 1004, 'Important update: Change in the course assessment format.', '2023-07-03'),
  (34, 1001, 'Discussion forum post marked as the best answer.', '2023-07-04'),
  (35, 1002, 'Reminder: Group project presentation scheduled next week.', '2023-07-05'),
  (36, 1003, 'New resource available: Supplementary video tutorials.', '2023-07-06'),
  (37, 1004, 'Feedback provided on your final project proposal.', '2023-07-07'),
  (38, 1001, 'Reminder: Course registration for the next term opens tomorrow.', '2023-07-08'),
  (39, 1002, 'New course announcement: Workshop on practical applications.', '2023-07-09'),
  (40, 1003, 'Important update: Change in the course textbook.', '2023-07-10'),
  (41, 1004, 'Discussion forum post liked by the course instructor.', '2023-07-11'),
  (42, 1001, 'Reminder: Course evaluation survey closing soon. Share your feedback!', '2023-07-12'),
  (43, 1002, 'New course module unlocked. Explore advanced topics!', '2023-07-13'),
  (44, 1003, 'Reminder: Assignment submission deadline extended by 2 days.', '2023-07-14'),
  (45, 1004, 'Important announcement: Course project showcase event next week.', '2023-07-15'),
  (46, 1001, 'New course announcement: Webinar on career opportunities.', '2023-07-16'),
  (47, 1002, 'Reminder: Final exam date and venue announced.', '2023-07-17'),
  (48, 1003, 'Discussion forum post selected as a featured discussion.', '2023-07-18'),
  (49, 1004, 'Feedback provided on your midterm exam performance.', '2023-07-19'),
  (50, 1001, 'New course resource: Additional practice exercises.', '2023-07-20');





-- Perform functionalities

-- Retrieve the names of all users who have enrolled in a course titled 'Database Management' along with their contact details.
-- using join 
select users.Name,users.ContactDetails  
from users join enrollment join course
on users.UserID=enrollment.UserID and enrollment.courseID=course.CourseID
where course.CourseTitle="Database Management";

-- Find the names of users who posted a comment on 6 Month in 2023 using correlated
select users.Name 
from users 
where exists( select discussionforum.PostDate
from discussionforum
where users.UserID=discussionforum.UserID AND PostDate="2023-06-01"
);

-- Display Grades of those students who enrolled on 15 date using nested 
select grading.Grade
from grading
where grading.EnrollmentID in( select enrollment.EnrollmentID
from enrollment
where enrollment.EnrollmentDate like "%15"
);

-- Display sum of  students  which has Prerequisites of Introduction to Programming
select count(users.UserID) as Total_ITC_Students
from users join enrollment join course
on users.UserID=enrollment.UserID and enrollment.CourseID=course.CourseID
where course.Prerequisites="Introduction to Programming";

-- Retrieve the details of a course, including the instructor's name and contact details.
SELECT Course.CourseTitle, Course.CourseDescription, Users.Name AS InstructorName, Users.ContactDetails
FROM Course
JOIN Users ON Course.InstructorID = Users.UserID;

-- Retrieve the names of users who have enrolled in courses taught by a specific instructor.
SELECT Name
FROM Users
WHERE UserID IN (SELECT InstructorID FROM Course WHERE users.UserID = course.instructorID);

-- Retrieve the average completion rate of a course by calculating the ratio of completed modules to the total number of modules for each enrollment.
SELECT AVG(completedModules * 100 / (SELECT COUNT(*) FROM CourseContent WHERE CourseID = Course.CourseID)) AS AverageCompletionRate
FROM Progress
 JOIN Enrollment ON Progress.EnrollmentID = Enrollment.EnrollmentID
 JOIN Course ON Enrollment.CourseID = Course.CourseID;
 
 -- Retrieve the course IDs and titles of courses that have prerequisites.
 SELECT CourseID, CourseTitle
FROM Course
WHERE CourseID IN (SELECT CourseID FROM Course WHERE Prerequisites IS NOT NULL);

-- Retrieve the names of users who have completed all the modules of a specific course.
SELECT Users.Name
FROM Users
JOIN Enrollment ON Users.UserID = Enrollment.UserID
JOIN Progress ON Enrollment.EnrollmentID = Progress.EnrollmentID
WHERE Progress.OverallCourseCompletionStatus like "Completed";

-- Retrieve the course titles and descriptions of courses that have at least one enrollment.
SELECT CourseTitle, CourseDescription
FROM Course
WHERE CourseID IN (SELECT DISTINCT CourseID FROM Enrollment);

-- Retrieve the usernames and educational backgrounds of users who have posted comments on a specific discussion forum.
SELECT Users.Username, Users.EducationalBackground
FROM Users
WHERE UserID IN (SELECT UserID FROM PostComments WHERE ForumID = forumID);

-- Retrieve the course titles and the count of enrolled users for each course.
SELECT CourseTitle, (
  SELECT COUNT(*) FROM Enrollment WHERE Enrollment.CourseID = Course.CourseID
) AS EnrolledUsersCount
FROM Course;

-- Get the course titles and the number of discussions in the discussion forum for each course
SELECT course.CourseTitle, COUNT(discussionforum.ForumID) AS NumDiscussions
FROM Course 
LEFT JOIN discussionForum  ON course.CourseID = discussionForum.CourseID
GROUP BY course.CourseTitle;

-- Retrieve the usernames of users who have received notifications containing the word "important"
SELECT users.Name
FROM Users 
WHERE EXISTS (
  SELECT *
  FROM notifications 
  WHERE users.UserID = notifications.UserID AND notifications.NotificationContent LIKE '%important%'
);

-- Retrieve the course title, instructor name, and number of enrolled users for each course
SELECT course.CourseTitle, users.Name AS InstructorName, COUNT(enrollment.UserID) AS NumEnrolledUsers
FROM Course JOIN users 
 ON course.InstructorID = users.UserID
LEFT JOIN enrollment  
ON course.CourseID = enrollment.CourseID
GROUP BY course.CourseTitle, users.Name;