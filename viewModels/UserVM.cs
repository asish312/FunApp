using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace FunActivityApp.viewModels
{
    public class UserVM
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string ProfilImage { get; set; }
        public string Team { get; set; }
        public string Role { get; set; }
        public string Location { get; set; }
        public string Address { get; set; }
        public string Hby { get; set; }
        public string Skill { get; set; }
    }

    public class QuizVM
    {
        public int QuizID { get; set; }
        public string QuizName { get; set; }
        public List<SelectListItem> ListOfQuizz { get; set; }
    }

    public class QuestionVM
    {
        public int QuestionID { get; set; }
        public string QuestionText { get; set; }
        public string QuestionType { get; set; }
        public string Anwser { get; set; }
        public ICollection<ChoiceVM> Choices { get; set; }

        [Display(Name = "My Date:")]
        [DisplayFormat(DataFormatString = "{0:dd-MMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ReaminTime { get; set; }
    }

    public class ChoiceVM
    {
        public int ChoiceID { get; set; }
        public string ChoiceText { get; set; }
    }

    public class QuizAnswersVM
    {
        public int QuestionID { get; set; }
        public string QuestionText { get; set; }
        public string AnswerQ { get; set; }
        public bool isCorrect { get; set; }
        public bool isAnswered { get; set; }
    }
}