; ModuleID = 'svp_simple_702_001.bc'
source_filename = "./svp_simple_702_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 0, align 4
@h = global i32 0, align 4
@i = global i32 0, align 4

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
define void @assume_abort_if_not(i32 %0) #0 !dbg !24 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4, !tbaa !13
  %3 = load i32, i32* %2, align 4, !dbg !25, !tbaa !13
  %4 = icmp ne i32 %3, 0, !dbg !25
  br i1 %4, label %6, label %5, !dbg !26

5:                                                ; preds = %1
  call void @abort() #4, !dbg !27
  unreachable, !dbg !27

6:                                                ; preds = %1
  ret void, !dbg !28
}

; Function Attrs: nounwind uwtable
define void @svp_simple_702_001_isr_1(i8* %0) #0 !dbg !29 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !30
  %6 = bitcast i32* %3 to i8*, !dbg !32
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5, !dbg !32
  %7 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !33
  store i32 %7, i32* %3, align 4, !dbg !34, !tbaa !13
  %8 = bitcast i32* %4 to i8*, !dbg !35
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5, !dbg !35
  %9 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !36
  store i32 %9, i32* %4, align 4, !dbg !37, !tbaa !13
  %10 = bitcast i32* %5 to i8*, !dbg !38
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #5, !dbg !38
  %11 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !39
  store i32 %11, i32* %5, align 4, !dbg !40, !tbaa !13
  %12 = load i32, i32* %3, align 4, !dbg !41, !tbaa !13
  %13 = icmp slt i32 %12, 1000, !dbg !42
  br i1 %13, label %14, label %32, !dbg !41

14:                                               ; preds = %1
  %15 = load i32, i32* @g, align 4, !dbg !43, !tbaa !13
  store i32 %15, i32* %3, align 4, !dbg !44, !tbaa !13
  %16 = load i32, i32* @h, align 4, !dbg !45, !tbaa !13
  store i32 %16, i32* %4, align 4, !dbg !46, !tbaa !13
  %17 = load i32, i32* %4, align 4, !dbg !47, !tbaa !13
  %18 = load i32, i32* %3, align 4, !dbg !48, !tbaa !13
  %19 = icmp sle i32 %17, %18, !dbg !49
  %20 = zext i1 %19 to i32, !dbg !49
  call void @__VERIFIER_assert(i32 %20), !dbg !50
  %21 = load i32, i32* %3, align 4, !dbg !51, !tbaa !13
  %22 = load i32, i32* %4, align 4, !dbg !52, !tbaa !13
  %23 = icmp eq i32 %21, %22, !dbg !53
  %24 = zext i1 %23 to i32, !dbg !53
  call void @__VERIFIER_assert(i32 %24), !dbg !54
  %25 = load i32, i32* %3, align 4, !dbg !55, !tbaa !13
  %26 = call i32 @plus(i32 %25, i32 31), !dbg !56
  store i32 %26, i32* @i, align 4, !dbg !57, !tbaa !13
  %27 = load i32, i32* @i, align 4, !dbg !58, !tbaa !13
  store i32 %27, i32* %5, align 4, !dbg !59, !tbaa !13
  %28 = load i32, i32* %5, align 4, !dbg !60, !tbaa !13
  %29 = load i32, i32* %3, align 4, !dbg !61, !tbaa !13
  %30 = icmp sge i32 %28, %29, !dbg !62
  %31 = zext i1 %30 to i32, !dbg !62
  call void @__VERIFIER_assert(i32 %31), !dbg !63
  br label %32, !dbg !64

32:                                               ; preds = %14, %1
  %33 = bitcast i32* %5 to i8*, !dbg !65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #5, !dbg !65
  %34 = bitcast i32* %4 to i8*, !dbg !65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #5, !dbg !65
  %35 = bitcast i32* %3 to i8*, !dbg !65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #5, !dbg !65
  ret void, !dbg !65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: nounwind uwtable
define i32 @plus(i32 %0, i32 %1) #0 !dbg !66 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !13
  store i32 %1, i32* %4, align 4, !tbaa !13
  %5 = load i32, i32* %4, align 4, !dbg !67, !tbaa !13
  %6 = icmp sge i32 %5, 0, !dbg !68
  br i1 %6, label %14, label %7, !dbg !69

7:                                                ; preds = %2
  %8 = load i32, i32* %3, align 4, !dbg !70, !tbaa !13
  %9 = sext i32 %8 to i64, !dbg !70
  %10 = load i32, i32* %4, align 4, !dbg !71, !tbaa !13
  %11 = sext i32 %10 to i64, !dbg !71
  %12 = sub nsw i64 -2147483648, %11, !dbg !72
  %13 = icmp sge i64 %9, %12, !dbg !73
  br label %14, !dbg !69

14:                                               ; preds = %7, %2
  %15 = phi i1 [ true, %2 ], [ %13, %7 ]
  %16 = zext i1 %15 to i32, !dbg !69
  call void @assume_abort_if_not(i32 %16), !dbg !74
  %17 = load i32, i32* %4, align 4, !dbg !75, !tbaa !13
  %18 = icmp sle i32 %17, 0, !dbg !76
  br i1 %18, label %24, label %19, !dbg !77

19:                                               ; preds = %14
  %20 = load i32, i32* %3, align 4, !dbg !78, !tbaa !13
  %21 = load i32, i32* %4, align 4, !dbg !79, !tbaa !13
  %22 = sub nsw i32 2147483647, %21, !dbg !80
  %23 = icmp sle i32 %20, %22, !dbg !81
  br label %24, !dbg !77

24:                                               ; preds = %19, %14
  %25 = phi i1 [ true, %14 ], [ %23, %19 ]
  %26 = zext i1 %25 to i32, !dbg !77
  call void @assume_abort_if_not(i32 %26), !dbg !82
  %27 = load i32, i32* %3, align 4, !dbg !83, !tbaa !13
  %28 = load i32, i32* %4, align 4, !dbg !84, !tbaa !13
  %29 = add nsw i32 %27, %28, !dbg !85
  ret i32 %29, !dbg !86
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_702_001_main() #0 !dbg !87 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !88
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !88
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !89
  store i32 %3, i32* %1, align 4, !dbg !90, !tbaa !13
  %4 = load i32, i32* %1, align 4, !dbg !91, !tbaa !13
  %5 = icmp sgt i32 %4, -1000, !dbg !92
  br i1 %5, label %6, label %11, !dbg !91

6:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !93, !tbaa !13
  %7 = load i32, i32* %1, align 4, !dbg !94, !tbaa !13
  store i32 %7, i32* @g, align 4, !dbg !95, !tbaa !13
  %8 = load i32, i32* %1, align 4, !dbg !96, !tbaa !13
  %9 = call i32 @plus(i32 %8, i32 -17), !dbg !97
  store i32 %9, i32* @h, align 4, !dbg !98, !tbaa !13
  %10 = load i32, i32* %1, align 4, !dbg !99, !tbaa !13
  store i32 %10, i32* @h, align 4, !dbg !100, !tbaa !13
  store i32 3, i32* @i, align 4, !dbg !101, !tbaa !13
  br label %11, !dbg !102

11:                                               ; preds = %6, %0
  %12 = bitcast i32* %1 to i8*, !dbg !103
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #5, !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind uwtable
define i32 @isr_plus(i32 %0, i32 %1) #0 !dbg !105 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4, !tbaa !13
  store i32 %1, i32* %4, align 4, !tbaa !13
  %5 = load i32, i32* %4, align 4, !dbg !106, !tbaa !13
  %6 = icmp sge i32 %5, 0, !dbg !107
  br i1 %6, label %14, label %7, !dbg !108

7:                                                ; preds = %2
  %8 = load i32, i32* %3, align 4, !dbg !109, !tbaa !13
  %9 = sext i32 %8 to i64, !dbg !109
  %10 = load i32, i32* %4, align 4, !dbg !110, !tbaa !13
  %11 = sext i32 %10 to i64, !dbg !110
  %12 = sub nsw i64 -2147483648, %11, !dbg !111
  %13 = icmp sge i64 %9, %12, !dbg !112
  br label %14, !dbg !108

14:                                               ; preds = %7, %2
  %15 = phi i1 [ true, %2 ], [ %13, %7 ]
  %16 = zext i1 %15 to i32, !dbg !108
  call void @assume_abort_if_not(i32 %16), !dbg !113
  %17 = load i32, i32* %4, align 4, !dbg !114, !tbaa !13
  %18 = icmp sle i32 %17, 0, !dbg !115
  br i1 %18, label %24, label %19, !dbg !116

19:                                               ; preds = %14
  %20 = load i32, i32* %3, align 4, !dbg !117, !tbaa !13
  %21 = load i32, i32* %4, align 4, !dbg !118, !tbaa !13
  %22 = sub nsw i32 2147483647, %21, !dbg !119
  %23 = icmp sle i32 %20, %22, !dbg !120
  br label %24, !dbg !116

24:                                               ; preds = %19, %14
  %25 = phi i1 [ true, %14 ], [ %23, %19 ]
  %26 = zext i1 %25 to i32, !dbg !116
  call void @assume_abort_if_not(i32 %26), !dbg !121
  %27 = load i32, i32* %3, align 4, !dbg !122, !tbaa !13
  %28 = load i32, i32* %4, align 4, !dbg !123, !tbaa !13
  %29 = add nsw i32 %27, %28, !dbg !124
  ret i32 %29, !dbg !125
}

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
!1 = !DIFile(filename: "svp_simple_702_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_702_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 3, column: 41, scope: !12)
!18 = !DILocation(line: 3, column: 40, scope: !12)
!19 = !DILocation(line: 3, column: 39, scope: !12)
!20 = !DILocation(line: 3, column: 48, scope: !12)
!21 = !DILocation(line: 3, column: 58, scope: !12)
!22 = !DILocation(line: 3, column: 72, scope: !12)
!23 = !DILocation(line: 3, column: 84, scope: !12)
!24 = distinct !DISubprogram(name: "assume_abort_if_not", scope: !8, file: !8, line: 4, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !DILocation(line: 5, column: 7, scope: !24)
!26 = !DILocation(line: 5, column: 6, scope: !24)
!27 = !DILocation(line: 5, column: 14, scope: !24)
!28 = !DILocation(line: 6, column: 1, scope: !24)
!29 = distinct !DISubprogram(name: "svp_simple_702_001_isr_1", scope: !8, file: !8, line: 20, type: !9, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !{!31, !31, i64 0}
!31 = !{!"any pointer", !15, i64 0}
!32 = !DILocation(line: 21, column: 3, scope: !29)
!33 = !DILocation(line: 21, column: 11, scope: !29)
!34 = !DILocation(line: 21, column: 7, scope: !29)
!35 = !DILocation(line: 22, column: 3, scope: !29)
!36 = !DILocation(line: 22, column: 11, scope: !29)
!37 = !DILocation(line: 22, column: 7, scope: !29)
!38 = !DILocation(line: 23, column: 3, scope: !29)
!39 = !DILocation(line: 23, column: 11, scope: !29)
!40 = !DILocation(line: 23, column: 7, scope: !29)
!41 = !DILocation(line: 24, column: 7, scope: !29)
!42 = !DILocation(line: 24, column: 9, scope: !29)
!43 = !DILocation(line: 25, column: 9, scope: !29)
!44 = !DILocation(line: 25, column: 7, scope: !29)
!45 = !DILocation(line: 26, column: 9, scope: !29)
!46 = !DILocation(line: 26, column: 7, scope: !29)
!47 = !DILocation(line: 27, column: 23, scope: !29)
!48 = !DILocation(line: 27, column: 28, scope: !29)
!49 = !DILocation(line: 27, column: 25, scope: !29)
!50 = !DILocation(line: 27, column: 5, scope: !29)
!51 = !DILocation(line: 29, column: 23, scope: !29)
!52 = !DILocation(line: 29, column: 28, scope: !29)
!53 = !DILocation(line: 29, column: 25, scope: !29)
!54 = !DILocation(line: 29, column: 5, scope: !29)
!55 = !DILocation(line: 31, column: 14, scope: !29)
!56 = !DILocation(line: 31, column: 9, scope: !29)
!57 = !DILocation(line: 31, column: 7, scope: !29)
!58 = !DILocation(line: 32, column: 9, scope: !29)
!59 = !DILocation(line: 32, column: 7, scope: !29)
!60 = !DILocation(line: 33, column: 23, scope: !29)
!61 = !DILocation(line: 33, column: 28, scope: !29)
!62 = !DILocation(line: 33, column: 25, scope: !29)
!63 = !DILocation(line: 33, column: 5, scope: !29)
!64 = !DILocation(line: 35, column: 3, scope: !29)
!65 = !DILocation(line: 37, column: 1, scope: !29)
!66 = distinct !DISubprogram(name: "plus", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 56, column: 23, scope: !66)
!68 = !DILocation(line: 56, column: 25, scope: !66)
!69 = !DILocation(line: 56, column: 30, scope: !66)
!70 = !DILocation(line: 56, column: 33, scope: !66)
!71 = !DILocation(line: 56, column: 52, scope: !66)
!72 = !DILocation(line: 56, column: 50, scope: !66)
!73 = !DILocation(line: 56, column: 35, scope: !66)
!74 = !DILocation(line: 56, column: 3, scope: !66)
!75 = !DILocation(line: 57, column: 23, scope: !66)
!76 = !DILocation(line: 57, column: 25, scope: !66)
!77 = !DILocation(line: 57, column: 30, scope: !66)
!78 = !DILocation(line: 57, column: 33, scope: !66)
!79 = !DILocation(line: 57, column: 51, scope: !66)
!80 = !DILocation(line: 57, column: 49, scope: !66)
!81 = !DILocation(line: 57, column: 35, scope: !66)
!82 = !DILocation(line: 57, column: 3, scope: !66)
!83 = !DILocation(line: 58, column: 10, scope: !66)
!84 = !DILocation(line: 58, column: 14, scope: !66)
!85 = !DILocation(line: 58, column: 12, scope: !66)
!86 = !DILocation(line: 58, column: 3, scope: !66)
!87 = distinct !DISubprogram(name: "svp_simple_702_001_main", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 40, column: 3, scope: !87)
!89 = !DILocation(line: 40, column: 11, scope: !87)
!90 = !DILocation(line: 40, column: 7, scope: !87)
!91 = !DILocation(line: 41, column: 7, scope: !87)
!92 = !DILocation(line: 41, column: 9, scope: !87)
!93 = !DILocation(line: 43, column: 7, scope: !87)
!94 = !DILocation(line: 44, column: 9, scope: !87)
!95 = !DILocation(line: 44, column: 7, scope: !87)
!96 = !DILocation(line: 45, column: 14, scope: !87)
!97 = !DILocation(line: 45, column: 9, scope: !87)
!98 = !DILocation(line: 45, column: 7, scope: !87)
!99 = !DILocation(line: 47, column: 9, scope: !87)
!100 = !DILocation(line: 47, column: 7, scope: !87)
!101 = !DILocation(line: 49, column: 7, scope: !87)
!102 = !DILocation(line: 51, column: 3, scope: !87)
!103 = !DILocation(line: 53, column: 1, scope: !87)
!104 = !DILocation(line: 52, column: 3, scope: !87)
!105 = distinct !DISubprogram(name: "isr_plus", scope: !8, file: !8, line: 60, type: !9, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!106 = !DILocation(line: 61, column: 23, scope: !105)
!107 = !DILocation(line: 61, column: 25, scope: !105)
!108 = !DILocation(line: 61, column: 30, scope: !105)
!109 = !DILocation(line: 61, column: 33, scope: !105)
!110 = !DILocation(line: 61, column: 52, scope: !105)
!111 = !DILocation(line: 61, column: 50, scope: !105)
!112 = !DILocation(line: 61, column: 35, scope: !105)
!113 = !DILocation(line: 61, column: 3, scope: !105)
!114 = !DILocation(line: 62, column: 23, scope: !105)
!115 = !DILocation(line: 62, column: 25, scope: !105)
!116 = !DILocation(line: 62, column: 30, scope: !105)
!117 = !DILocation(line: 62, column: 33, scope: !105)
!118 = !DILocation(line: 62, column: 51, scope: !105)
!119 = !DILocation(line: 62, column: 49, scope: !105)
!120 = !DILocation(line: 62, column: 35, scope: !105)
!121 = !DILocation(line: 62, column: 3, scope: !105)
!122 = !DILocation(line: 63, column: 10, scope: !105)
!123 = !DILocation(line: 63, column: 14, scope: !105)
!124 = !DILocation(line: 63, column: 12, scope: !105)
!125 = !DILocation(line: 63, column: 3, scope: !105)
