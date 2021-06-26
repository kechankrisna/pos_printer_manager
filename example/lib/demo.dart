class Demo {
  static String getInvoiceContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SALE INVOICE</title>


</head>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Khmer&display=swap');
    @page {
        footer: page-footer;
        margin: 1cm;
        margin-top: 35pt;
        margin-bottom: 50pt;
        margin-footer: 18pt;
    }
    
    @page :first {
        margin-top: 0;
    }
    
    *,
    html {
        padding: 0;
        margin: 0;
        font-family: 'KhmerOS', DejaVu Sans !important;
    }
    
    * {
        -webkit-print-color-adjust: true;
        -webkit-print-color-adjust: exact;
    }
    
    body,
    p {
        margin: 0px;
        padding: 0px;
        font-family: 'khmeros', serif;
    }
    
    body {
        background: white;
    }
    
    p {
        line-height: 22px;
    }
    
    .invoice {
        margin: auto;
    }
    
    .container {
        padding: 5px 15px;
    }
    
    hr {
        border-top: 1px dashed silver;
    }
    
    .text-center {
        text-align: center;
    }
    
    .text-left {
        text-align: left;
    }
    
    .text-right {
        text-align: left;
    }
    
    .text-justify {
        text-align: justify;
    }
    
    .right {
        float: right;
    }
    
    .left {
        float: left;
    }
    
    .total {
        font-size: 1.5em;
        margin: 5px;
    }
    
    a {
        color: #1976d2;
    }
    
    span {
        color: #3a3a3a;
    }
    
    .full-width {
        width: 100%;
    }
    
    .width-100 {
        width: 100px;
    }
    
    .width-200 {
        width: 200px;
    }
    
    .width-300 {
        width: 300px;
    }
    
    .width-400 {
        width: 400px;
    }
    
    .inline-block {
        display: inline-block;
    }
    
    .flex {
        display: flex;
    }
    
    .half {
        width: 50%;
    }
    
    .padding_left {
        padding-left: 15px;
    }
    
    .padding_right {
        padding-right: 15px;
    }
    
    td {
        border: 1px solid silver;
        padding: 8px;
        border-collapse: collapse;
    }
    
    thead td {
        background: #4BAF4F;
        /* #1565c0; */
        color: white;
    }
    
    thead td,
    tfoot td {
        font-weight: bold;
    }
    
    @page {
        margin: 0;
        size: A4;
    }
    
    header,
    footer {
        margin: auto;
    }
    
    .logo {
        width: 55px;
        height: 55px;
        background-position: center;
        /* Center the image */
        background-repeat: no-repeat;
        /* Do not repeat the image */
        background-size: cover;
    }
    
    .logo img {
        width: 100%;
    }
    
    header,
    footer {
        position: fixed;
        transform: translate3d(0, 0, 0);
    }
    
    footer {
        bottom: 0;
    }
    
    .page-break {
        page-break-after: always;
    }
    
    .capitalize {
        text-transform: capitalize;
    }
    /*
* bootstrap
*/
    
    .col-xs-1,
    .col-sm-1,
    .col-md-1,
    .col-lg-1,
    .col-xs-2,
    .col-sm-2,
    .col-md-2,
    .col-lg-2,
    .col-xs-3,
    .col-sm-3,
    .col-md-3,
    .col-lg-3,
    .col-xs-4,
    .col-sm-4,
    .col-md-4,
    .col-lg-4,
    .col-xs-5,
    .col-sm-5,
    .col-md-5,
    .col-lg-5,
    .col-xs-6,
    .col-sm-6,
    .col-md-6,
    .col-lg-6,
    .col-xs-7,
    .col-sm-7,
    .col-md-7,
    .col-lg-7,
    .col-xs-8,
    .col-sm-8,
    .col-md-8,
    .col-lg-8,
    .col-xs-9,
    .col-sm-9,
    .col-md-9,
    .col-lg-9,
    .col-xs-10,
    .col-sm-10,
    .col-md-10,
    .col-lg-10,
    .col-xs-11,
    .col-sm-11,
    .col-md-11,
    .col-lg-11,
    .col-xs-12,
    .col-sm-12,
    .col-md-12,
    .col-lg-12 {
        position: relative;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
    }
    
    .col-xs-1,
    .col-xs-2,
    .col-xs-3,
    .col-xs-4,
    .col-xs-5,
    .col-xs-6,
    .col-xs-7,
    .col-xs-8,
    .col-xs-9,
    .col-xs-10,
    .col-xs-11,
    .col-xs-12 {
        float: left;
    }
    
    .col-xs-12 {
        width: 100%;
    }
    
    .col-xs-11 {
        width: 91.66666667%;
    }
    
    .col-xs-10 {
        width: 83.33333333%;
    }
    
    .col-xs-9 {
        width: 75%;
    }
    
    .col-xs-8 {
        width: 66.66666667%;
    }
    
    .col-xs-7 {
        width: 58.33333333%;
    }
    
    .col-xs-6 {
        width: 50%;
    }
    
    .col-xs-5 {
        width: 41.66666667%;
    }
    
    .col-xs-4 {
        width: 33.33333333%;
    }
    
    .col-xs-3 {
        width: 25%;
    }
    
    .col-xs-2 {
        width: 16.66666667%;
    }
    
    .col-xs-1 {
        width: 8.33333333%;
    }
    
    .col-xs-pull-12 {
        right: 100%;
    }
    
    .col-xs-pull-11 {
        right: 91.66666667%;
    }
    
    .col-xs-pull-10 {
        right: 83.33333333%;
    }
    
    .col-xs-pull-9 {
        right: 75%;
    }
    
    .col-xs-pull-8 {
        right: 66.66666667%;
    }
    
    .col-xs-pull-7 {
        right: 58.33333333%;
    }
    
    .col-xs-pull-6 {
        right: 50%;
    }
    
    .col-xs-pull-5 {
        right: 41.66666667%;
    }
    
    .col-xs-pull-4 {
        right: 33.33333333%;
    }
    
    .col-xs-pull-3 {
        right: 25%;
    }
    
    .col-xs-pull-2 {
        right: 16.66666667%;
    }
    
    .col-xs-pull-1 {
        right: 8.33333333%;
    }
    
    .col-xs-pull-0 {
        right: auto;
    }
    
    .col-xs-push-12 {
        left: 100%;
    }
    
    .col-xs-push-11 {
        left: 91.66666667%;
    }
    
    .col-xs-push-10 {
        left: 83.33333333%;
    }
    
    .col-xs-push-9 {
        left: 75%;
    }
    
    .col-xs-push-8 {
        left: 66.66666667%;
    }
    
    .col-xs-push-7 {
        left: 58.33333333%;
    }
    
    .col-xs-push-6 {
        left: 50%;
    }
    
    .col-xs-push-5 {
        left: 41.66666667%;
    }
    
    .col-xs-push-4 {
        left: 33.33333333%;
    }
    
    .col-xs-push-3 {
        left: 25%;
    }
    
    .col-xs-push-2 {
        left: 16.66666667%;
    }
    
    .col-xs-push-1 {
        left: 8.33333333%;
    }
    
    .col-xs-push-0 {
        left: auto;
    }
    
    .col-xs-offset-12 {
        margin-left: 100%;
    }
    
    .col-xs-offset-11 {
        margin-left: 91.66666667%;
    }
    
    .col-xs-offset-10 {
        margin-left: 83.33333333%;
    }
    
    .col-xs-offset-9 {
        margin-left: 75%;
    }
    
    .col-xs-offset-8 {
        margin-left: 66.66666667%;
    }
    
    .col-xs-offset-7 {
        margin-left: 58.33333333%;
    }
    
    .col-xs-offset-6 {
        margin-left: 50%;
    }
    
    .col-xs-offset-5 {
        margin-left: 41.66666667%;
    }
    
    .col-xs-offset-4 {
        margin-left: 33.33333333%;
    }
    
    .col-xs-offset-3 {
        margin-left: 25%;
    }
    
    .col-xs-offset-2 {
        margin-left: 16.66666667%;
    }
    
    .col-xs-offset-1 {
        margin-left: 8.33333333%;
    }
    
    .col-xs-offset-0 {
        margin-left: 0;
    }
    
    @media (min-width: 768px) {
        .col-sm-1,
        .col-sm-2,
        .col-sm-3,
        .col-sm-4,
        .col-sm-5,
        .col-sm-6,
        .col-sm-7,
        .col-sm-8,
        .col-sm-9,
        .col-sm-10,
        .col-sm-11,
        .col-sm-12 {
            float: left;
        }
        .col-sm-12 {
            width: 100%;
        }
        .col-sm-11 {
            width: 91.66666667%;
        }
        .col-sm-10 {
            width: 83.33333333%;
        }
        .col-sm-9 {
            width: 75%;
        }
        .col-sm-8 {
            width: 66.66666667%;
        }
        .col-sm-7 {
            width: 58.33333333%;
        }
        .col-sm-6 {
            width: 50%;
        }
        .col-sm-5 {
            width: 41.66666667%;
        }
        .col-sm-4 {
            width: 33.33333333%;
        }
        .col-sm-3 {
            width: 25%;
        }
        .col-sm-2 {
            width: 16.66666667%;
        }
        .col-sm-1 {
            width: 8.33333333%;
        }
        .col-sm-pull-12 {
            right: 100%;
        }
        .col-sm-pull-11 {
            right: 91.66666667%;
        }
        .col-sm-pull-10 {
            right: 83.33333333%;
        }
        .col-sm-pull-9 {
            right: 75%;
        }
        .col-sm-pull-8 {
            right: 66.66666667%;
        }
        .col-sm-pull-7 {
            right: 58.33333333%;
        }
        .col-sm-pull-6 {
            right: 50%;
        }
        .col-sm-pull-5 {
            right: 41.66666667%;
        }
        .col-sm-pull-4 {
            right: 33.33333333%;
        }
        .col-sm-pull-3 {
            right: 25%;
        }
        .col-sm-pull-2 {
            right: 16.66666667%;
        }
        .col-sm-pull-1 {
            right: 8.33333333%;
        }
        .col-sm-pull-0 {
            right: auto;
        }
        .col-sm-push-12 {
            left: 100%;
        }
        .col-sm-push-11 {
            left: 91.66666667%;
        }
        .col-sm-push-10 {
            left: 83.33333333%;
        }
        .col-sm-push-9 {
            left: 75%;
        }
        .col-sm-push-8 {
            left: 66.66666667%;
        }
        .col-sm-push-7 {
            left: 58.33333333%;
        }
        .col-sm-push-6 {
            left: 50%;
        }
        .col-sm-push-5 {
            left: 41.66666667%;
        }
        .col-sm-push-4 {
            left: 33.33333333%;
        }
        .col-sm-push-3 {
            left: 25%;
        }
        .col-sm-push-2 {
            left: 16.66666667%;
        }
        .col-sm-push-1 {
            left: 8.33333333%;
        }
        .col-sm-push-0 {
            left: auto;
        }
        .col-sm-offset-12 {
            margin-left: 100%;
        }
        .col-sm-offset-11 {
            margin-left: 91.66666667%;
        }
        .col-sm-offset-10 {
            margin-left: 83.33333333%;
        }
        .col-sm-offset-9 {
            margin-left: 75%;
        }
        .col-sm-offset-8 {
            margin-left: 66.66666667%;
        }
        .col-sm-offset-7 {
            margin-left: 58.33333333%;
        }
        .col-sm-offset-6 {
            margin-left: 50%;
        }
        .col-sm-offset-5 {
            margin-left: 41.66666667%;
        }
        .col-sm-offset-4 {
            margin-left: 33.33333333%;
        }
        .col-sm-offset-3 {
            margin-left: 25%;
        }
        .col-sm-offset-2 {
            margin-left: 16.66666667%;
        }
        .col-sm-offset-1 {
            margin-left: 8.33333333%;
        }
        .col-sm-offset-0 {
            margin-left: 0;
        }
    }
    
    @media (min-width: 992px) {
        .col-md-1,
        .col-md-2,
        .col-md-3,
        .col-md-4,
        .col-md-5,
        .col-md-6,
        .col-md-7,
        .col-md-8,
        .col-md-9,
        .col-md-10,
        .col-md-11,
        .col-md-12 {
            float: left;
        }
        .col-md-12 {
            width: 100%;
        }
        .col-md-11 {
            width: 91.66666667%;
        }
        .col-md-10 {
            width: 83.33333333%;
        }
        .col-md-9 {
            width: 75%;
        }
        .col-md-8 {
            width: 66.66666667%;
        }
        .col-md-7 {
            width: 58.33333333%;
        }
        .col-md-6 {
            width: 50%;
        }
        .col-md-5 {
            width: 41.66666667%;
        }
        .col-md-4 {
            width: 33.33333333%;
        }
        .col-md-3 {
            width: 25%;
        }
        .col-md-2 {
            width: 16.66666667%;
        }
        .col-md-1 {
            width: 8.33333333%;
        }
        .col-md-pull-12 {
            right: 100%;
        }
        .col-md-pull-11 {
            right: 91.66666667%;
        }
        .col-md-pull-10 {
            right: 83.33333333%;
        }
        .col-md-pull-9 {
            right: 75%;
        }
        .col-md-pull-8 {
            right: 66.66666667%;
        }
        .col-md-pull-7 {
            right: 58.33333333%;
        }
        .col-md-pull-6 {
            right: 50%;
        }
        .col-md-pull-5 {
            right: 41.66666667%;
        }
        .col-md-pull-4 {
            right: 33.33333333%;
        }
        .col-md-pull-3 {
            right: 25%;
        }
        .col-md-pull-2 {
            right: 16.66666667%;
        }
        .col-md-pull-1 {
            right: 8.33333333%;
        }
        .col-md-pull-0 {
            right: auto;
        }
        .col-md-push-12 {
            left: 100%;
        }
        .col-md-push-11 {
            left: 91.66666667%;
        }
        .col-md-push-10 {
            left: 83.33333333%;
        }
        .col-md-push-9 {
            left: 75%;
        }
        .col-md-push-8 {
            left: 66.66666667%;
        }
        .col-md-push-7 {
            left: 58.33333333%;
        }
        .col-md-push-6 {
            left: 50%;
        }
        .col-md-push-5 {
            left: 41.66666667%;
        }
        .col-md-push-4 {
            left: 33.33333333%;
        }
        .col-md-push-3 {
            left: 25%;
        }
        .col-md-push-2 {
            left: 16.66666667%;
        }
        .col-md-push-1 {
            left: 8.33333333%;
        }
        .col-md-push-0 {
            left: auto;
        }
        .col-md-offset-12 {
            margin-left: 100%;
        }
        .col-md-offset-11 {
            margin-left: 91.66666667%;
        }
        .col-md-offset-10 {
            margin-left: 83.33333333%;
        }
        .col-md-offset-9 {
            margin-left: 75%;
        }
        .col-md-offset-8 {
            margin-left: 66.66666667%;
        }
        .col-md-offset-7 {
            margin-left: 58.33333333%;
        }
        .col-md-offset-6 {
            margin-left: 50%;
        }
        .col-md-offset-5 {
            margin-left: 41.66666667%;
        }
        .col-md-offset-4 {
            margin-left: 33.33333333%;
        }
        .col-md-offset-3 {
            margin-left: 25%;
        }
        .col-md-offset-2 {
            margin-left: 16.66666667%;
        }
        .col-md-offset-1 {
            margin-left: 8.33333333%;
        }
        .col-md-offset-0 {
            margin-left: 0;
        }
    }
    
    @media (min-width: 1200px) {
        .col-lg-1,
        .col-lg-2,
        .col-lg-3,
        .col-lg-4,
        .col-lg-5,
        .col-lg-6,
        .col-lg-7,
        .col-lg-8,
        .col-lg-9,
        .col-lg-10,
        .col-lg-11,
        .col-lg-12 {
            float: left;
        }
        .col-lg-12 {
            width: 100%;
        }
        .col-lg-11 {
            width: 91.66666667%;
        }
        .col-lg-10 {
            width: 83.33333333%;
        }
        .col-lg-9 {
            width: 75%;
        }
        .col-lg-8 {
            width: 66.66666667%;
        }
        .col-lg-7 {
            width: 58.33333333%;
        }
        .col-lg-6 {
            width: 50%;
        }
        .col-lg-5 {
            width: 41.66666667%;
        }
        .col-lg-4 {
            width: 33.33333333%;
        }
        .col-lg-3 {
            width: 25%;
        }
        .col-lg-2 {
            width: 16.66666667%;
        }
        .col-lg-1 {
            width: 8.33333333%;
        }
        .col-lg-pull-12 {
            right: 100%;
        }
        .col-lg-pull-11 {
            right: 91.66666667%;
        }
        .col-lg-pull-10 {
            right: 83.33333333%;
        }
        .col-lg-pull-9 {
            right: 75%;
        }
        .col-lg-pull-8 {
            right: 66.66666667%;
        }
        .col-lg-pull-7 {
            right: 58.33333333%;
        }
        .col-lg-pull-6 {
            right: 50%;
        }
        .col-lg-pull-5 {
            right: 41.66666667%;
        }
        .col-lg-pull-4 {
            right: 33.33333333%;
        }
        .col-lg-pull-3 {
            right: 25%;
        }
        .col-lg-pull-2 {
            right: 16.66666667%;
        }
        .col-lg-pull-1 {
            right: 8.33333333%;
        }
        .col-lg-pull-0 {
            right: auto;
        }
        .col-lg-push-12 {
            left: 100%;
        }
        .col-lg-push-11 {
            left: 91.66666667%;
        }
        .col-lg-push-10 {
            left: 83.33333333%;
        }
        .col-lg-push-9 {
            left: 75%;
        }
        .col-lg-push-8 {
            left: 66.66666667%;
        }
        .col-lg-push-7 {
            left: 58.33333333%;
        }
        .col-lg-push-6 {
            left: 50%;
        }
        .col-lg-push-5 {
            left: 41.66666667%;
        }
        .col-lg-push-4 {
            left: 33.33333333%;
        }
        .col-lg-push-3 {
            left: 25%;
        }
        .col-lg-push-2 {
            left: 16.66666667%;
        }
        .col-lg-push-1 {
            left: 8.33333333%;
        }
        .col-lg-push-0 {
            left: auto;
        }
        .col-lg-offset-12 {
            margin-left: 100%;
        }
        .col-lg-offset-11 {
            margin-left: 91.66666667%;
        }
        .col-lg-offset-10 {
            margin-left: 83.33333333%;
        }
        .col-lg-offset-9 {
            margin-left: 75%;
        }
        .col-lg-offset-8 {
            margin-left: 66.66666667%;
        }
        .col-lg-offset-7 {
            margin-left: 58.33333333%;
        }
        .col-lg-offset-6 {
            margin-left: 50%;
        }
        .col-lg-offset-5 {
            margin-left: 41.66666667%;
        }
        .col-lg-offset-4 {
            margin-left: 33.33333333%;
        }
        .col-lg-offset-3 {
            margin-left: 25%;
        }
        .col-lg-offset-2 {
            margin-left: 16.66666667%;
        }
        .col-lg-offset-1 {
            margin-left: 8.33333333%;
        }
        .col-lg-offset-0 {
            margin-left: 0;
        }
    }
</style>

<body>
    <div class="invoice">
        <div class="container">
            <div class="full-width inline-block">
                <div class="logo" style="float: left;position:absolute; background-image: url(data:image/jpg;base64,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)">
                </div>
                <!-- header part -->
                <div class="text-center">
                    <h1 class="capitalize" style="padding-left:-15px;">invoice</h1>

                </div>
            </div>
            <hr>
            <!-- end header part -->

            <!-- information -->
            <div class="full-width inline-block">
                <div class="half left">
                    <div class="padding_right">
                        <p class="capitalize">store</p>
                        <p><b class="capitalize">name:</b> ONE CLICK(SR) </p>
                        <p><b class="capitalize">address:</b> Siemreap </p>
                        <p><b class="capitalize">phone:</b> 069777566 </p>
                        <p><b class="capitalize">email:</b> admin@theoneclicks.com </p>
                        <p><b class="capitalize">date:</b> 2021-01-23 12:11:40 </p>
                        <p><b class="capitalize">invoice:</b> S13-1000049 </p>
                        <p><b class="capitalize">reference:</b> ................................. </p>
                    </div>

                </div>
                <div class="half right">
                    <div class="padding_right">
                        <p class="capitalize">customer</p>
                        <p><b class="capitalize">name:</b> JBL PoiPet(Daro) </p>
                        <p><b class="capitalize">address:</b> .................................
                        </p>
                        <p><b class="capitalize">phone:</b> 089494793 </p>
                        <p><b class="capitalize">email:</b> ................................. </p>
                        <p><b class="capitalize">payment:</b> completed </p>

                    </div>
                </div>
            </div>

            <p class="capitalize">note: </p>
            <hr>
            <!-- product part -->
            <table align="center" width="100%" cellpadding="0" cellspacing="0" role="presentation">
                <thead>
                    <tr>
                        <td align="center" class="capitalize">No.</td>
                        <td align="center" class="capitalize">description</td>
                        <td align="center" class="capitalize">quantity</td>
                        <td align="center" class="capitalize">unit price</td>
                        <td align="center" class="capitalize">discount</td>
                        <td align="center" class="capitalize">total</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>

                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            BE-GNT-P9828V6
                        </td>
                        <td align="center" valign="top">5</td>
                        <td align="center" valign="top">35</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">175</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            A2-X20RJ-1080P
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">27</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">189</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            Memory Card 32G
                        </td>
                        <td align="center" valign="top">7</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">0</td>
                    </tr>
                    <tr>
                        <td align="center">1</td>
                        <td align="left">
                            D2-R1080P
                        </td>
                        <td align="center" valign="top">1</td>
                        <td align="center" valign="top">21</td>
                        <td align="center" valign="top">0</td>
                        <td align="center" valign="top">21</td>
                    </tr>


                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">total price (US Dollar) </td>
                        <td rowspan="1" align="center">\$ 385.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">total price (KHMER Riel) </td>
                        <td rowspan="1" align="center">៛ 1559250.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">discount ( 0% )</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">vat ( 0% )</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">paid</td>
                        <td rowspan="1" align="center">\$ 385.00</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" class="capitalize">due</td>
                        <td rowspan="1" align="center">\$ 0.00</td>
                    </tr>
                </tfoot>

            </table>

        </div>
        </hr>
        <div class="container">
            <p>Thank you for shopping with us. Please come again</p>
        </div>
    </div>
    <div class="invoice">
        <footer class="container full-width flex">Published by MYLEKHA on 2021-03-26 20:49:15. Current timezone is Asia/Phnom_Penh </footer>
    </div>
    <br>
    <br>
</body>

</html>
   """;
  }

  static String getReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RECEIPT</title>
</head>

<style>
    body,
    p {
        margin: 0px;
        padding: 0px;
    }
    
    body {
        background: #eee;
        width: 576px;
        font-size: 1.8em;
    }
    
    .receipt {
        max-width: 576px;
        margin: auto;
        background: white;
    }
    
    .container {
        padding: 5px 15px;
    }
    
    hr {
        border-top: 1px dashed black;
    }
    
    .text-center {
        text-align: center;
    }
    
    .text-left {
        text-align: left;
    }
    
    .text-right {
        text-align: left;
    }
    
    .text-justify {
        text-align: justify;
    }
    
    .right {
        float: right;
    }
    
    .left {
        float: left;
    }
    
    .total {
        font-size: 2.5em;
        margin: 5px;
    }
    
    a {
        color: #1976d2;
    }
    
    span {
        color: black;
    }
    
    .full-width {
        width: 100%;
    }
    
    .inline-block {
        display: inline-block;
    }
</style>

<body>

    <div class="receipt">
        <div class="container">
            <!-- header part -->
            <div class="text-center">
                <p>MYLEKHA STORE</p>
                <hr>
                <p class="total">320.00</p>
                <span>Total</span>
            </div>
            <hr>
            <!-- end header part -->

            <p>Cashier: owner</p>
            <p>POS: POS 1</p>
            <hr>
            <!-- product part -->
            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>

            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>
            <hr>
            <!-- end product part -->

            <!-- footer part -->
            <p class="full-width inline-block">
                <b class="left">Total</b>
                <b class="right">4.00</b>
            </p>
            <p class="full-width inline-block">
                <b class="left">Cash</b>
                <b class="right">4.00</b>
            </p>
        </div>
        <hr>
        <!-- end footer part -->
        <div class="container">
            <p class="full-width inline-block">
                <span class="left">01/09/2020 22:23</span>
                <span class="right">No 3-10001</span>
            </p>
        </div>

    </div>
    <div class="container text-center">
        <br>
        <p>@2020 <a href="https://mylekha.app">MYLEKHA</a>. All right reserved.</p>
    </div>


</body>

</html>  
  """;
  }

  static String getShortReceiptContent() {
    return """
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RECEIPT</title>
</head>

<style>
    body,
    p {
        margin: 0px;
        padding: 0px;
    }
    
    body {
        background: #eee;
        width: 576px;
        font-size: 1.8em
    }
    
    .receipt {
        max-width: 576px;
        margin: auto;
        background: white;
    }
    
    .container {
        padding: 5px 15px;
    }
    
    hr {
        border-top: 2px dashed black;
    }
    
    .text-center {
        text-align: center;
    }
    
    .text-left {
        text-align: left;
    }
    
    .text-right {
        text-align: left;
    }
    
    .text-justify {
        text-align: justify;
    }
    
    .right {
        float: right;
    }
    
    .left {
        float: left;
    }
    
    .total {
        font-size: 2.5em;
        margin: 5px;
    }
    
    a {
        color: #1976d2;
    }
    
    span {
        color: black;
    }
    
    .full-width {
        width: 100%;
    }
    
    .inline-block {
        display: inline-block;
    }
</style>

<body>

    <div class="receipt">
        <div class="container">
            <!-- header part -->
            <div class="text-center">
                <p>MYLEKHA STORE</p>
                <hr>
                <p class="total">320.00</p>
                <span>Total</span>
            </div>
            <hr>
            <!-- end header part -->

            <p>Cashier: owner</p>
            <p>POS: POS 1</p>
            <hr>
            <!-- product part -->
            <p class="full-width inline-block">
                <b class="left">Item c1 p2</b>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>

            <p class="full-width inline-block">
                <strong class="left">Item c1 p2</strong>
                <b class="right">4.00</b>
            </p>
            <p><span>2 x 2.00</span></p>
            <p><span>+egg (0.60)</span></p>
            <p><span>+rice (3.00)</span></p>


            <hr>
            <!-- end product part -->

            <!-- footer part -->
            <p class="full-width inline-block">
                <b class="left">Total</b>
                <b class="right">4.00</b>
            </p>
            <p class="full-width inline-block">
                <b class="left">Cash</b>
                <b class="right">4.00</b>
            </p>
        </div>
        <hr>
        <!-- end footer part -->
        <div class="container">
            <p class="full-width inline-block">
                <span class="left">01/09/2020 22:23</span>
                <span class="right">No 3-10001</span>
            </p>
        </div>

    </div>
    <div class="container text-center">
        <br>
        <p>សូមអរគុណ</p>
        <p>@2020 <a href="https://mylekha.app">MYLEKHA</a>. All right reserved.</p>
    </div>
    <br>
    <br>


</body>

</html>  
  """;
  }
}
