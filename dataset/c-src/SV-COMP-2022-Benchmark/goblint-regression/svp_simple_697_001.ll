; ModuleID = 'svp_simple_697_001.bc'
source_filename = "./svp_simple_697_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !17, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !18
  br i1 %4, label %7, label %5, !dbg !19

5:                                                ; preds = %1
  br label %6, !dbg !20

6:                                                ; preds = %5
  call void @reach_error(), !dbg !21
  call void @abort() #4, !dbg !22
  unreachable, !dbg !22

7:                                                ; preds = %1
  ret void, !dbg !23
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @svp_simple_697_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8, !tbaa !25
  store i32 1, i32* @g, align 4, !dbg !27, !tbaa !13
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_697_001_main() #0 !dbg !29 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast i32* %1 to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #5, !dbg !30
  %5 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !31
  store i32 %5, i32* %1, align 4, !dbg !32, !tbaa !13
  %6 = bitcast i32* %2 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5, !dbg !33
  %7 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !34
  store i32 %7, i32* %2, align 4, !dbg !35, !tbaa !13
  %8 = bitcast i32* %3 to i8*, !dbg !36
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5, !dbg !36
  %9 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !37
  store i32 %9, i32* %3, align 4, !dbg !38, !tbaa !13
  %10 = load i32, i32* %3, align 4, !dbg !39, !tbaa !13
  store i32 %10, i32* @g, align 4, !dbg !40, !tbaa !13
  %11 = load i32, i32* @g, align 4, !dbg !41, !tbaa !13
  store i32 %11, i32* %1, align 4, !dbg !42, !tbaa !13
  %12 = load i32, i32* @g, align 4, !dbg !43, !tbaa !13
  store i32 %12, i32* %2, align 4, !dbg !44, !tbaa !13
  %13 = load i32, i32* %1, align 4, !dbg !45, !tbaa !13
  %14 = load i32, i32* %2, align 4, !dbg !46, !tbaa !13
  %15 = icmp eq i32 %13, %14, !dbg !47
  %16 = zext i1 %15 to i32, !dbg !47
  call void @__VERIFIER_assert(i32 %16), !dbg !48
  %17 = bitcast i32* %3 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !49
  %18 = bitcast i32* %2 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #5, !dbg !49
  %19 = bitcast i32* %1 to i8*, !dbg !49
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #5, !dbg !49
  ret i32 0, !dbg !50
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_697_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_697_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 3, column: 22, scope: !7)
!11 = !DILocation(line: 3, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 4, column: 41, scope: !12)
!18 = !DILocation(line: 4, column: 40, scope: !12)
!19 = !DILocation(line: 4, column: 39, scope: !12)
!20 = !DILocation(line: 4, column: 48, scope: !12)
!21 = !DILocation(line: 4, column: 58, scope: !12)
!22 = !DILocation(line: 4, column: 72, scope: !12)
!23 = !DILocation(line: 4, column: 84, scope: !12)
!24 = distinct !DISubprogram(name: "svp_simple_697_001_isr_1", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 12, column: 6, scope: !24)
!28 = !DILocation(line: 13, column: 1, scope: !24)
!29 = distinct !DISubprogram(name: "svp_simple_697_001_main", scope: !8, file: !8, line: 15, type: !9, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 16, column: 3, scope: !29)
!31 = !DILocation(line: 16, column: 11, scope: !29)
!32 = !DILocation(line: 16, column: 7, scope: !29)
!33 = !DILocation(line: 17, column: 3, scope: !29)
!34 = !DILocation(line: 17, column: 11, scope: !29)
!35 = !DILocation(line: 17, column: 7, scope: !29)
!36 = !DILocation(line: 18, column: 3, scope: !29)
!37 = !DILocation(line: 18, column: 11, scope: !29)
!38 = !DILocation(line: 18, column: 7, scope: !29)
!39 = !DILocation(line: 20, column: 7, scope: !29)
!40 = !DILocation(line: 20, column: 5, scope: !29)
!41 = !DILocation(line: 22, column: 7, scope: !29)
!42 = !DILocation(line: 22, column: 5, scope: !29)
!43 = !DILocation(line: 23, column: 7, scope: !29)
!44 = !DILocation(line: 23, column: 5, scope: !29)
!45 = !DILocation(line: 24, column: 21, scope: !29)
!46 = !DILocation(line: 24, column: 26, scope: !29)
!47 = !DILocation(line: 24, column: 23, scope: !29)
!48 = !DILocation(line: 24, column: 3, scope: !29)
!49 = !DILocation(line: 26, column: 1, scope: !29)
!50 = !DILocation(line: 25, column: 3, scope: !29)
