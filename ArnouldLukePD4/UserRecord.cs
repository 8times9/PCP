using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ArnouldLukePD4
{
    public class UserRecord
    {
        public int AccountID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int PreferredOS { get; set; }
        public int Awareness { get; set; }
        public DateTime DOB { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public int RoleID { get; set; }
    }
}