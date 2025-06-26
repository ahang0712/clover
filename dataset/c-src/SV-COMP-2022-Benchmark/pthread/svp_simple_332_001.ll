; ModuleID = 'svp_simple_332_001.bc'
source_filename = "./svp_simple_332_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = global i32 3, align 4
@j = global i32 6, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_332_001_isr_1(i8* %0) #0 !dbg !12 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %4 = bitcast i32* %3 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !17
  store i32 0, i32* %3, align 4, !dbg !18, !tbaa !19
  br label %5, !dbg !17

5:                                                ; preds = %13, %1
  %6 = load i32, i32* %3, align 4, !dbg !21, !tbaa !19
  %7 = icmp slt i32 %6, 20, !dbg !22
  br i1 %7, label %10, label %8, !dbg !23

8:                                                ; preds = %5
  %9 = bitcast i32* %3 to i8*, !dbg !23
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #4, !dbg !23
  br label %16

10:                                               ; preds = %5
  %11 = load i32, i32* @j, align 4, !dbg !24, !tbaa !19
  %12 = add nsw i32 %11, 1, !dbg !25
  store i32 %12, i32* @i, align 4, !dbg !26, !tbaa !19
  br label %13, !dbg !27

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !28, !tbaa !19
  %15 = add nsw i32 %14, 1, !dbg !28
  store i32 %15, i32* %3, align 4, !dbg !28, !tbaa !19
  br label %5, !dbg !23, !llvm.loop !29

16:                                               ; preds = %8
  ret void, !dbg !30
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_332_001_isr_2(i8* %0) #0 !dbg !31 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !13
  %4 = bitcast i32* %3 to i8*, !dbg !32
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4, !dbg !32
  store i32 0, i32* %3, align 4, !dbg !33, !tbaa !19
  br label %5, !dbg !32

5:                                                ; preds = %13, %1
  %6 = load i32, i32* %3, align 4, !dbg !34, !tbaa !19
  %7 = icmp slt i32 %6, 20, !dbg !35
  br i1 %7, label %10, label %8, !dbg !36

8:                                                ; preds = %5
  %9 = bitcast i32* %3 to i8*, !dbg !36
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #4, !dbg !36
  br label %16

10:                                               ; preds = %5
  %11 = load i32, i32* @i, align 4, !dbg !37, !tbaa !19
  %12 = add nsw i32 %11, 1, !dbg !38
  store i32 %12, i32* @j, align 4, !dbg !39, !tbaa !19
  br label %13, !dbg !40

13:                                               ; preds = %10
  %14 = load i32, i32* %3, align 4, !dbg !41, !tbaa !19
  %15 = add nsw i32 %14, 1, !dbg !41
  store i32 %15, i32* %3, align 4, !dbg !41, !tbaa !19
  br label %5, !dbg !36, !llvm.loop !42

16:                                               ; preds = %8
  ret void, !dbg !43
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_332_001_main(i32 %0, i8** %1) #0 !dbg !44 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4, !tbaa !19
  store i8** %1, i8*** %5, align 8, !tbaa !13
  %8 = bitcast i32* %6 to i8*, !dbg !45
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #4, !dbg !45
  %9 = load i32, i32* @i, align 4, !dbg !46, !tbaa !19
  %10 = icmp sge i32 %9, 46, !dbg !47
  %11 = zext i1 %10 to i32, !dbg !47
  store i32 %11, i32* %6, align 4, !dbg !48, !tbaa !19
  %12 = bitcast i32* %7 to i8*, !dbg !49
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #4, !dbg !49
  %13 = load i32, i32* @j, align 4, !dbg !50, !tbaa !19
  %14 = icmp sge i32 %13, 46, !dbg !51
  %15 = zext i1 %14 to i32, !dbg !51
  store i32 %15, i32* %7, align 4, !dbg !52, !tbaa !19
  %16 = load i32, i32* %6, align 4, !dbg !53, !tbaa !19
  %17 = icmp ne i32 %16, 0, !dbg !53
  br i1 %17, label %21, label %18, !dbg !54

18:                                               ; preds = %2
  %19 = load i32, i32* %7, align 4, !dbg !55, !tbaa !19
  %20 = icmp ne i32 %19, 0, !dbg !55
  br i1 %20, label %21, label %23, !dbg !53

21:                                               ; preds = %18, %2
  br label %22, !dbg !56

22:                                               ; preds = %21
  call void @reach_error(), !dbg !57
  call void @abort() #5, !dbg !58
  unreachable, !dbg !58

23:                                               ; preds = %18
  %24 = bitcast i32* %7 to i8*, !dbg !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #4, !dbg !59
  %25 = bitcast i32* %6 to i8*, !dbg !59
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #4, !dbg !59
  %26 = load i32, i32* %3, align 4, !dbg !59
  ret i32 %26, !dbg !59
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_332_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 5, type: !9, scopeLine: 5, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_332_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 5, column: 22, scope: !7)
!11 = !DILocation(line: 5, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_332_001_isr_1", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 13, column: 8, scope: !12)
!18 = !DILocation(line: 13, column: 12, scope: !12)
!19 = !{!20, !20, i64 0}
!20 = !{!"int", !15, i64 0}
!21 = !DILocation(line: 13, column: 19, scope: !12)
!22 = !DILocation(line: 13, column: 21, scope: !12)
!23 = !DILocation(line: 13, column: 3, scope: !12)
!24 = !DILocation(line: 14, column: 9, scope: !12)
!25 = !DILocation(line: 14, column: 11, scope: !12)
!26 = !DILocation(line: 14, column: 7, scope: !12)
!27 = !DILocation(line: 15, column: 3, scope: !12)
!28 = !DILocation(line: 13, column: 29, scope: !12)
!29 = distinct !{!29, !23, !27}
!30 = !DILocation(line: 16, column: 1, scope: !12)
!31 = distinct !DISubprogram(name: "svp_simple_332_001_isr_2", scope: !8, file: !8, line: 18, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 19, column: 8, scope: !31)
!33 = !DILocation(line: 19, column: 12, scope: !31)
!34 = !DILocation(line: 19, column: 19, scope: !31)
!35 = !DILocation(line: 19, column: 21, scope: !31)
!36 = !DILocation(line: 19, column: 3, scope: !31)
!37 = !DILocation(line: 20, column: 9, scope: !31)
!38 = !DILocation(line: 20, column: 11, scope: !31)
!39 = !DILocation(line: 20, column: 7, scope: !31)
!40 = !DILocation(line: 21, column: 3, scope: !31)
!41 = !DILocation(line: 19, column: 29, scope: !31)
!42 = distinct !{!42, !36, !40}
!43 = !DILocation(line: 22, column: 1, scope: !31)
!44 = distinct !DISubprogram(name: "svp_simple_332_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 26, column: 3, scope: !44)
!46 = !DILocation(line: 26, column: 15, scope: !44)
!47 = !DILocation(line: 26, column: 17, scope: !44)
!48 = !DILocation(line: 26, column: 7, scope: !44)
!49 = !DILocation(line: 28, column: 3, scope: !44)
!50 = !DILocation(line: 28, column: 15, scope: !44)
!51 = !DILocation(line: 28, column: 17, scope: !44)
!52 = !DILocation(line: 28, column: 7, scope: !44)
!53 = !DILocation(line: 30, column: 7, scope: !44)
!54 = !DILocation(line: 30, column: 13, scope: !44)
!55 = !DILocation(line: 30, column: 16, scope: !44)
!56 = !DILocation(line: 30, column: 23, scope: !44)
!57 = !DILocation(line: 31, column: 13, scope: !44)
!58 = !DILocation(line: 31, column: 27, scope: !44)
!59 = !DILocation(line: 34, column: 1, scope: !44)
