using FunActivityApp.EDMX;
using FunActivityApp.viewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace FunActivityApp.Controllers
{
    public class QuizzController : Controller
    {
        public Entities dbContext = new Entities();

        // GET: Quizz
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetUser()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetUser(UserVM user)
        {
            //Handle Error userid
            UserVM userConnected = dbContext.Users.Where(u => u.FullName == user.FullName)
                                         .Select(u => new UserVM
                                         {
                                             UserID = u.UserID,
                                             FullName = u.FullName,
                                             ProfilImage = u.ProfilImage,
                                             Team = u.Team,
                                             Role = u.Role,
                                             Location = u.Location,
                                             Address = u.Address,
                                             Hby = u.Hobbies,
                                             Skill = u.Skillsets
                                         }).FirstOrDefault();

            if (userConnected != null)
            {
                Session["UserConnected"] = userConnected;
                return RedirectToAction("SelectQuizz");
            }
            else
            {
                ViewBag.Msg = "User is not found. Please register or contact admin !!";
                return View("../Home/index");
                //  return View();
            }
        }

        [HttpGet]
        public ActionResult SelectQuizz()
        {
            QuizVM quiz = new viewModels.QuizVM();
            quiz.ListOfQuizz = dbContext.Quizs.Select(q => new SelectListItem
            {
                Text = q.QuizName,
                Value = q.QuizID.ToString()
            }).ToList();

            //ToDo:
            //var selected = quiz.ListOfQuizz.Where(x => x.Text == "Quiz Suits").FirstOrDefault();
            //selected.Selected = true;
            return View(quiz);
        }

        [HttpPost]
        public ActionResult SelectQuizz(QuizVM quiz)
        {
            QuizVM quizSelected = dbContext.Quizs.Where(q => q.QuizID == quiz.QuizID).Select(q => new QuizVM
            {
                QuizID = q.QuizID,
                QuizName = q.QuizName,
            }).FirstOrDefault();

            if (quizSelected != null)
            {
                Session["SelectedQuiz"] = quizSelected;

                return RedirectToAction("QuizTest");
            }
            return View();
        }

        [HttpGet]
        public ActionResult QuizTest()
        {
            QuizVM quizSelected = Session["SelectedQuiz"] as QuizVM;
            IQueryable<QuestionVM> questions = null;

            if (quizSelected != null)
            {
                questions = dbContext.Questions.Where(q => q.Quiz.QuizID == quizSelected.QuizID)
                   .Select(q => new QuestionVM
                   {
                       QuestionID = q.QuestionID,
                       QuestionText = q.QuestionText,
                       Choices = q.Choices.Select(c => new ChoiceVM
                       {
                           ChoiceID = c.ChoiceID,
                           ChoiceText = c.ChoiceText
                       }).ToList()
                   }).AsQueryable();
            }
            ViewBag.TimeExpire = DateTime.UtcNow.AddSeconds(65);
            return View(questions);
        }

        [HttpPost]
        public ActionResult QuizTest(List<QuizAnswersVM> resultQuiz)
        {
            //To Do: Validation and Error Handling
            var userInfo = Session["UserConnected"];

            var userInfoVM = (UserVM)userInfo;
            List<QuizAnswersVM> finalResultQuiz = new List<viewModels.QuizAnswersVM>();
            try
            {
                foreach (QuizAnswersVM answser in resultQuiz)
                {
                    var result = dbContext.Answers.Where(a => a.QuestionID == answser.QuestionID).Select(a => new QuizAnswersVM
                    {
                        QuestionID = a.QuestionID.Value,
                        AnswerQ = a.AnswerText,
                        isCorrect = answser.AnswerQ == null ? false : (answser.AnswerQ.ToLower().Equals(a.AnswerText.ToLower())),
                        isAnswered = answser.AnswerQ == null ? false : true
                    }).FirstOrDefault();

                    finalResultQuiz.Add(result);

                    using (var context = new Entities())
                    {
                        var qUserAns = new QuizUserAnswer()
                        {
                            QuestionID = answser.QuestionID,
                            AnswerTime = System.DateTime.Now,
                            IsRight = result.isCorrect,
                            UserID = userInfoVM.UserID,
                            IsAnswered = result.isAnswered
                        };

                        context.QuizUserAnswers.Add(qUserAns);
                        context.SaveChanges();
                    }
                    //var resultAns = dbContext.QuizUserAnswers.Where(a => a.QuestionID == answser.QuestionID).Select(a => new QuizAnswersVM
                    //{
                    //    QuestionID = a.QuestionID.Value,
                    //    AnswerQ = a.AnswerText,
                    //    isCorrect = answser.AnswerQ == null ? false : (answser.AnswerQ.ToLower().Equals(a.AnswerText.ToLower())),
                    //    isAnswered = answser.AnswerQ == null ? false : true
                    //}).FirstOrDefault();
                }
            }
            catch (Exception)
            {
                //ToDO
                // LogHelper.Log(SourceType.File).LogError("Error Message : " + ex.StackTrace + ex.Message);
                // return GetErrorView();
            }
            return Json(new { result = finalResultQuiz }, JsonRequestBehavior.AllowGet);
        }
    }
}