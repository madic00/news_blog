using AutoMapper;
using FluentValidation;
using NewsBlog.Application.Commands.Posts;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.Exceptions;
using NewsBlog.Application.UploadFile;
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
        private readonly IUploadFile _uploadFile;

        public EfUpdatePostCommand(NewsBlogContext context, IMapper mapper, UpdatePostValidator validator, IUploadFile uploadFile)
        {
            _context = context;
            _mapper = mapper;
            _validator = validator;
            _uploadFile = uploadFile;
        }

        public int Id => (int)UseCasesEnum.EfUpdatePostCommand;

        public string Name => "Update post";

        public void Execute(CreatePostDto request)
        {
            var post = _context.Posts.Find(request.Id);

            if(post == null)
            {
                throw new EntityNotFoundException(request.Id.Value, typeof(Domain.Post));
            }

            if(request.MainImg != null)
            {
                request.MainImg = _uploadFile.Upload(request.Image);
            } else
            {
                request.MainImg = post.MainImg;
            }

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, post);

            _context.SaveChanges();
        }
    }
}
