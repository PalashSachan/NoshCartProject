<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="NoshCart.Account.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .cnt {
            margin: 0;
            padding: 0;
        }

        .parent {
            margin: 50px 10px 0 20px;
            width: 300px;
            border-bottom: 2px solid #388e3c;
            position: relative;
            z-index: -1;
        }

            .parent:before,
            .parent:after,
            .child,
            .child2 {
                background: #388e3c;
                width: 15px;
                height: 15px;
                border-radius: 50%;
                border: 1px solid #388e3c;
                position: absolute;
                content: '';
                top: -8px;
            }

            .parent:before {
                left: 0;
            }

            .parent:after {
                right: 0;
            }

        .child {
            left: 33.33%;
            margin-left: -8px;
        }

        .child2 {
            left: 66.66%;
            margin-left: -8px;
        }

        .dt {
            color: #388e3c;
        }

        .dpt {
            float: left;
            margin-left: 2px;
            margin-top: -30px;
        }

        .fdt {
            margin-left: 98px;
            margin-top: -18px;
        }

        .sdt {
            margin-left: 195px;
            margin-top: -20px;
        }

        .ldt {
            margin-left: 280px;
            margin-top: -17px;
        }
    </style>
</head>
<body>
    
            <div class="cnt">
                <div class="dt">
                    <div class="dpt">
                        Ordered
      <div class="fdt">Packed</div>
                        <div class="sdt">Shipped</div>
                        <div class="ldt">Delivered</div>
                    </div>
                </div>
                <div class="parent">
                    <div class="child"></div>
                    <div class="child2"></div>
                </div>
            </div>

        
</body>
</html>
