using NewsBlog.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Extensions
{
    public static class UseCaseExtension
    {
        public static void AddDefaultUseCases(this User user)
        {
            var useCases = new HashSet<UserUseCase>
            {
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfDeleteUserCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfUpdateUserCommand },
                //new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetUsersQuery },
                //new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOneUserQuery },

                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetPostsQuery },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOnePostQuery },
                
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetCategoriesQuery },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOneCategoryQuery },
                
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfCreateCommentCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfUpdateCommentCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfDeleteCommentCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetCommentsQuery },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOneCommentQuery },

                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfCreatePostRatingCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfUpdatePostRatingCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfDeletePostRatingCommand },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetPostRatingsQuery },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOnePostRatingQuery },
                
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetTagsQuery },
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfGetOneTagQuery },
                
                new UserUseCase { UseCaseId = (int)UseCasesEnum.EfContactCommand }

            };

            user.UserUseCases = useCases;


        }
    }
}
