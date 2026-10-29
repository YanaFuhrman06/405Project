# Project Overview

### Context: 
Quick Draw (https://quickdraw.withgoogle.com/?locale=en_US) is an online game where players get a prompt and have 20 seconds to draw it and the game tries to guess the object in real time. Screenshot of my game results for context:

### Command to get data:
wget “https://storage.googleapis.com/quickdraw_dataset/full/simplified/$word.ndjson” where $word is the prompt like flower, tornado, etc *important note: some words have spaces like The Great Wall of China, so $word would be The%20Great%20Wall%20of%20China. I found the download url from poking around in the github repository and eventually finding this link: https://console.cloud.google.com/storage/browser/_details/quickdraw_dataset/full/simplified/The%20Great%20Wall%20of%20China.ndjson;tab=live_object*

### Questions of Interest:
Do some countries draw better than others? Which objects are hardest to draw? Are sports related objects on average easier to draw globally compared to other categories of objects? 

### Our Data:
**Primary Dataset:** The data found on Kaggle (https://www.kaggle.com/datasets/google/tinyquickdraw): 24.0 GB, 345 JSON files (one per object, 26-185 MB), about 50 million doodles drawn by players in 2017.

*The key columns we would use are:*
- Word: this is the object category
- Countrycode: this is the country the doodler is from
- Recognized: this is a binary whether or not the neural network was able to correctly guess the drawing

**Dataset 2:** Categories Dataset (AI generated)

We would also like to use AI to generate a secondary dataset that categorizes the types of images such as sports, nature, household objects, etc. so that we can also analyze whether the neural network behind Quick Draw has more successes in a particular category. This could be interesting to explore because different categories could be more universally understood and illustrated while others could differ between countries more. 

  Generated categories: 
  
    Household & Furniture (52)
    
    Animals (49)
    
    Food & Drink (32)
    
    Nature & Weather (25)
    
    Sports & Recreation (25)
    
    Transportation (25)
    
    Clothing & Accessories (24)
    
    Body Parts (19)
    
    Electronics & Technology (19)
    
    Buildings & Places (16)
    
    Office & School (14)
    
    Tools & Hardware (12)
    
    Music (10)
    
    Fantasy & Misc (10)
    
    Shapes & Symbols (9)
    
    Medical (4)

### Statistical Methods:
Multi-variable t-test (ANOVA) where the explanatory variables are word and country and the response variable is whether or not the drawing was guessed. 

### Computational steps:
We will run 345 parallel CHTC jobs (one per word). Each job summarizes its file by country and category, then we will combine the results in python. 
