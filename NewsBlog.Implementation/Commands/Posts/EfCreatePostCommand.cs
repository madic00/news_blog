using AutoMapper;
using FluentValidation;
using NewsBlog.Application.Commands.Posts;
using NewsBlog.Application.DataTransfer;
using NewsBlog.Application.UploadFile;
using NewsBlog.EfDataAccess;
using NewsBlog.Implementation.Validators.Posts;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewsBlog.Implementation.Commands.Posts
{
    public class EfCreatePostCommand : ICreatePostCommand
    {
        private readonly NewsBlogContext _context;
        private readonly IMapper _mapper;
        private readonly IUploadFile _uploadFile;
        private readonly CreatePostValidator _validator;

        public EfCreatePostCommand(NewsBlogContext context, IMapper mapper, IUploadFile uploadFile, CreatePostValidator validator)
        {
            _context = context;
            _mapper = mapper;
            _uploadFile = uploadFile;
            _validator = validator;
        }

        public int Id => (int)UseCasesEnum.EfCreatePostCommand;

        public string Name => "Create Post";

        public void Execute(CreatePostDto request)
        {
            _validator.ValidateAndThrow(request);

            request.MainImg = _uploadFile.Upload(request.Image);     
            
            var post = _mapper.Map<Domain.Post>(request);

            _context.Posts.Add(post);
            _context.SaveChanges();
        }
    }
}
