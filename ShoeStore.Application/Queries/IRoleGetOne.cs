using ShoeStore.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoeStore.Application.Queries
{
    public interface IRoleGetOne : IQuery<int,RoleDto>
    {
    }
}
