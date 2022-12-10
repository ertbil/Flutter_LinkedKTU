enum AccountType {
  lecturer,
  student,
  employer,
  onError,
}

const accountTypes = ["Lecturer", "Student", "Employer"];

string2AccounTypeConverter(String stringAccountType) {
  switch (stringAccountType) {
    case "Lecturer":
      return AccountType.lecturer;
    case "Student":
      return AccountType.student;
    case "Employer":
      return AccountType.employer;
  }
}

accountType2StringConverter(AccountType accountType) {
  switch(accountType) {
    case AccountType.student:
      return "Student";
    case AccountType.lecturer:
      return "Lecturer";
    case AccountType.employer:
      return "Employer";
    case AccountType.onError:
      return;

  }
}

