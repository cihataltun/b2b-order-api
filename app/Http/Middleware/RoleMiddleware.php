<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     * @param  string|null  ...$roles
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle(Request $request, Closure $next, string ...$roles): Response
    {
        if (!auth('sanctum')->check()) {
            return response()->json(['message' => 'Unauthenticated.'], 401);
        }

        $user = auth('sanctum')->user();

        if ($user && in_array($user->role, $roles)) {
            return $next($request);
        }

        return response()->json(['message' => 'Forbidden. You do not have the right permissions.'], 403);
    }
}
