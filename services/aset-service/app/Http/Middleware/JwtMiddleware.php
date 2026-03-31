<?php

namespace App\Http\Middleware;

use Closure;
use Exception;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class JwtMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        try {
            JWTAuth::parseToken()->authenticate();
        } catch (TokenExpiredException $e) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Token expired',
            ], 401);
        } catch (TokenInvalidException $e) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Token invalid',
            ], 401);
        } catch (JWTException $e) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Token not provided',
            ], 401);
        } catch (Exception $e) {
            return response()->json([
                'status' => 401,
                'responseCode' => 401,
                'responseMessage' => 'Unauthorized',
            ], 401);
        }

        return $next($request);
    }
}
