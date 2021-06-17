using AutoMapper;
using FluentValidation;
using NewsBlog.Application.Commands.Posts;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Posts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Posts
{
    public class EfUpdatePostCommand : IUpdatePostCommand
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly UpdatePostValidator _validator;

        public EfUpdatePostCommand(NewsBlogContext context, IMapper mapper, UpdatePostValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfUpdatePostCommand;

        public string Name => "Update post";

        public void Execute(PostDto request)
        {
            var post = _context.Posts.Find(request.Id);

            if(post == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Domain.Post));
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, post);

            _context.SaveChanges();
        }
    }
}
