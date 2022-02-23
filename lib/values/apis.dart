const baseUrl = "https://staging-api.astrotak.com";

const bearerToken =
    "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ";

class APIs {
  static const getQuestionCategory = "/api/question/category/all";
  static const getFamilyMemberList = "/api/relative/all";
  static const deleteFamilyMember = "/api/relative/delete/";
  static const addProfile = "/api/relative";
  static const getPlaces = "/api/location/place?inputPlace=Delhi";
  static const updateProfile = "/api/relative/update/";
}
