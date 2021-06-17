using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation
{
    public enum RoleEnum
    {
        Admin = 1,
        User = 2
    }

    public enum UseCasesEnum 
    {
        EfCreateUserCommand = 1,
        EfDeleteUserCommand = 2,
        EfUpdateUserCommand = 3,
        //EfGetUsersQuery = 4,
        //EfGetOneUserQuery = 5,

        EfCreatePostCommand = 6,
        EfDeletePostCommand = 7,
        EfUpdatePostCommand = 8,
        EfGetPostsQuery = 9,
        EfGetOnePostQuery = 10,

        EfCreateCategoryCommand = 11,
        EfDeleteCategoryCommand = 12,
        EfUpdateCategoryCommand = 13,
        EfGetCategoriesQuery = 14,
        EfGetOneCategoryQuery = 15,

        EfCreateCommentCommand = 16,
        EfDeleteCommentCommand = 17,
        EfUpdateCommentCommand = 18,
        EfGetCommentsQuery = 19,
        EfGetOneCommentQuery = 20,

        EfCreatePostRatingCommand = 26,
        EfDeletePostRatingCommand = 27,
        EfUpdatePostRatingCommand = 28,
        EfGetPostRatingsQuery = 29,
        EfGetOnePostRatingQuery = 30,

        EfCreateTagCommand = 36,
        EfDeleteTagCommand = 37,
        EfUpdateTagCommand = 38,
        EfGetTagsQuery = 39,
        EfGetOneTagQuery = 40,

        EfGetUseCaseLogsQuery = 41,
        EfGetUseCaseLogQuery = 42,

        EfCreateUserUseCaseCommand = 51,
        EfUpdateUserUseCaseCommand = 52,
        EfDeleteUserUseCaseCommand = 53,
        EfGetUserUseCasesQuery = 54,
        EfGetOneUserUseCaseQuery = 55,

        EfLoginUserCommand = 61,

        EfAdminCreateUserCommand = 71,
        EfAdminDeleteUserCommand = 72,
        EfAdminUpdateUserCommand = 73,
        EfGetUsersQuery = 74,
        EfGetOneUserQuery = 75,

        EfContactCommand = 81

    }

}
