using ShoeStore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Commands
{
    public interface IUserAddCommand : ICommand<UserAddDto>
    {
    }
}
