class Utils {
  static String? getBackgroundImageURL(String? weatherId) {
    switch (weatherId) {
      case 'Thunderstorm':
        //Thunderstorm
        //गडगडाट
        return 'https://images.unsplash.com/photo-1429552077091-836152271555?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D';
      case 'Drizzle':
        //Drizzle
        //रिमझिम पाऊस
        return 'https://c8.alamy.com/comp/2C9BJM3/california-poppy-flowers-during-drizzle-rain-on-sunny-day-2C9BJM3.jpg';
      case 'Rain':
        //Rain
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLWYSzikHMg_dyw125isi09l7AQQKpurEGmA&usqp=CAU';
      case 'Snow':
        // Snow
        return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuNFYkCgRKcobnzclb9Htl_-UnhdrHsqWfdxMYfTQrtSfj-TfBK5LLEQ-NozQyB99nbt0&usqp=CAU';
      case 'Atmosphere':
        //Atmosphere
        return 'https://i.pinimg.com/236x/0f/4e/d4/0f4ed4e1471a72fc834d13bbb214b888.jpg';
      case 'Clear':
        //Clear
        return 'https://static.vecteezy.com/system/resources/previews/024/939/555/non_2x/white-clouds-in-the-blue-sky-beautiful-bright-blue-background-light-cloudy-good-weather-curly-clouds-on-a-sunny-day-free-photo.jpg';
      case 'Clouds':
        //Clouds
        return 'https://previews.123rf.com/images/sarapon/sarapon1803/sarapon180300003/97285057-portrait-of-a-blue-sky-and-white-cloud-in-a-clear-summer-sky-to-serve-as-a-background-for-text-or.jpg';
      case 'Haze':
        //Haze
        return 'https://media.istockphoto.com/id/1015250340/photo/road-in-fog.jpg?s=612x612&w=0&k=20&c=J840vfXjNORBbyQB3RtYYniA46HBHcFNStLlb5A5_ws=';
      default:
        return 'https://static.vecteezy.com/system/resources/previews/024/939/555/non_2x/white-clouds-in-the-blue-sky-beautiful-bright-blue-background-light-cloudy-good-weather-curly-clouds-on-a-sunny-day-free-photo.jpg';
    }
  }
}
