# Quiz Application
  The Quiz Application is an interactive learning platform designed to provide users with a dynamic quiz experience. The app utilizes structured data to manage classes, chapters, and MCQ types, offering a seamless flow for users to access relevant content.


# Data Structure
  The application uses several key data structures:

  # CLASS: Contains information about available classes.
  # CHAPTER: Stores chapters associated with each class.
  # CATEGORY_TAG_MASTER: Links chapters to specific MCQ category tags.
  # CATEGORY_MASTER: Defines the types of MCQs available.
# Application Flow
 # 1. Class Selection : 
    Users can select a class from a dropdown list, which is populated dynamically based on the CLASS data structure.
    The app retrieves and displays available class names and their IDs.
 # 2. Chapter Retrieval
    After the user selects a class, the app retrieves the corresponding chapters:
    The selected class ID is used to filter and find matching chapters.
    These chapters are then displayed in a list for the user.
 # 3. MCQ Type Identification
    The app identifies the MCQ types associated with each chapter:
    It first retrieves category IDs linked to the chapter from the CATEGORY_TAG_MASTER data.
    Using these category IDs, the app looks up and displays the relevant MCQ types from the CATEGORY_MASTER data.