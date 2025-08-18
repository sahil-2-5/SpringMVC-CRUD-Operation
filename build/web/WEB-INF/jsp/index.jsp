<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp,container-queries"></script>
        <title>Scooby</title>
        <script src="./Js/ajax.js" type="text/javascript"></script>
        <script src="./Js/validation.js" type="text/javascript"></script>
    </head>

    <body class="bg-gray-100">
        <!-- Navbar -->
        <div class="fixed top-0 left-0 w-full h-20 bg-violet-600 text-white shadow-lg z-50">
            <div class="max-w-6xl mx-auto h-full flex justify-between items-center px-6">
                <!-- Brand Name -->
                <h1 class="text-2xl font-bold tracking-wide">Scooby</h1>

                <!-- Navigation Buttons -->
                <div class="flex gap-6">
                    <button 
                        onclick="LoadForm()"
                        class="bg-white text-violet-600 px-5 py-2 rounded-lg font-medium hover:bg-violet-100 transition">
                        Form
                    </button>
                    <button 
                        onclick="LoadAccountData()"
                        class="bg-yellow-400 text-black px-5 py-2 rounded-lg font-medium hover:bg-yellow-300 transition">
                        Show
                    </button>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="pt-24 px-6">
            <div id="load" class="p-6"></div>
        </div>
    </body>
</html>
