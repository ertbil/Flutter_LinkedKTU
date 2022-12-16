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


AccountType? int2AccountTypeConverter(int intAccountType) {
  switch (intAccountType) {
    case 2:
      return AccountType.lecturer;
    case 1:
      return AccountType.student;
    case 3:
      return AccountType.employer;
  }
}

int? accountType2IntConverter(AccountType accountType) {
  switch (accountType) {
    case AccountType.lecturer:
      return 2;
    case AccountType.student:
      return 1;
    case AccountType.employer:
      return 3;
    default:
      return null;
  }
}

