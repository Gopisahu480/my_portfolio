class Project {
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}

List<Project> projectList = [
  Project(
    'MBC (My Baby Connect)',
    'Developed a comprehensive school management app with features like student management, live camera access, and attendance automation.',
    'assets/images/coffee.png',
    'https://play.google.com/store/apps/details?id=com.fixingdots.htkc.mbc_admin&pcampaignid=web_share',
  ),
  Project(
    'FixQ (Complex Quotation Management)',
    'Created a Flutter-based quotation management app with role-based access control,Integrated backend APIs with the frontend, ensuring seamless data flow and user experience.',
    'assets/images/car.png',
    'https://play.google.com/store/apps/details?id=com.fixingdots.htkc.fixq',
  ),
  Project(
      'FixHR App',
      'Developed a Travel and Daily Allowance (TA DA) Management System using Flutter with Bloc state management,Implemented real-time data synchronization and report generation features.',
      'assets/images/alarm.jpg',
      'https://play.google.com/store/apps/details?id=com.fixingdots.htkc.fixhr&hl=en_IN'),
  Project(
      'Saloon App',
      'Developed a salon booking and management app with real-time appointments and user profile, '
          'Implemented Firebase for user authentication, database management, and push notifications.',
      'assets/images/cui.png',
      'https://github.com/Gopisahu480/salon_booking_app-main'),
  Project(
    'BBK (Blue Birds Kindergarten)',
    'Developed a comprehensive school management app with features like student management, live camera access, and attendance automation.',
    'assets/images/coffee.png',
    'https://play.google.com/store/apps/details?id=com.fixingdots.htkc.bbk_admin',
  ),
  Project(
      'Short Video App',
      ' Developed a short video streaming platform with features like video uploading, sharing, and live streaming,Integrated Firebase for user authentication, video storage, and real-time notifications.Implemented advanced video editing, filters, and interactive features such as likes, comments, and followers.',
      'assets/images/task.png',
      'https://github.com/Gopisahu480/shortvideo'),
  Project(
      'Doctor Appointment Application',
      'Introducing the extraordinary "Doctor Appointment System" - a state-of-the-art Flutter UI application that redefines healthcare accessibility and efficiency. Seamlessly crafted, this app empowers users to effortlessly select doctors based on categories, engage in smooth messaging, and access detailed profiles.',
      'assets/images/doctor.png',
      'https://github.com/Gopisahu480/Doctor-Appointment-Application-UI-master'),
];
