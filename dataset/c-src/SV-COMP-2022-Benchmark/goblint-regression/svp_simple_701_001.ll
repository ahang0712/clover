; ModuleID = 'svp_simple_701_001.bc'
source_filename = "./svp_simple_701_001.c"
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
define void @svp_simple_701_001_isr_1(i8* %0) #0 !dbg !24 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %2, align 8, !tbaa !25
  %6 = bitcast i32* %3 to i8*, !dbg !27
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5, !dbg !27
  %7 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !28
  store i32 %7, i32* %3, align 4, !dbg !29, !tbaa !13
  %8 = bitcast i32* %4 to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #5, !dbg !30
  %9 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !31
  store i32 %9, i32* %4, align 4, !dbg !32, !tbaa !13
  %10 = bitcast i32* %5 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #5, !dbg !33
  %11 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !34
  store i32 %11, i32* %5, align 4, !dbg !35, !tbaa !13
  %12 = load i32, i32* %3, align 4, !dbg !36, !tbaa !13
  %13 = icmp slt i32 %12, 1000, !dbg !37
  br i1 %13, label %14, label %32, !dbg !36

14:                                               ; preds = %1
  %15 = load i32, i32* @g, align 4, !dbg !38, !tbaa !13
  store i32 %15, i32* %3, align 4, !dbg !39, !tbaa !13
  %16 = load i32, i32* @h, align 4, !dbg !40, !tbaa !13
  store i32 %16, i32* %4, align 4, !dbg !41, !tbaa !13
  %17 = load i32, i32* %4, align 4, !dbg !42, !tbaa !13
  %18 = load i32, i32* %3, align 4, !dbg !43, !tbaa !13
  %19 = icmp sle i32 %17, %18, !dbg !44
  %20 = zext i1 %19 to i32, !dbg !44
  call void @__VERIFIER_assert(i32 %20), !dbg !45
  %21 = load i32, i32* %3, align 4, !dbg !46, !tbaa !13
  %22 = load i32, i32* %4, align 4, !dbg !47, !tbaa !13
  %23 = icmp eq i32 %21, %22, !dbg !48
  %24 = zext i1 %23 to i32, !dbg !48
  call void @__VERIFIER_assert(i32 %24), !dbg !49
  %25 = load i32, i32* %3, align 4, !dbg !50, !tbaa !13
  %26 = add nsw i32 %25, 31, !dbg !51
  store i32 %26, i32* @i, align 4, !dbg !52, !tbaa !13
  %27 = load i32, i32* @i, align 4, !dbg !53, !tbaa !13
  store i32 %27, i32* %5, align 4, !dbg !54, !tbaa !13
  %28 = load i32, i32* %5, align 4, !dbg !55, !tbaa !13
  %29 = load i32, i32* %3, align 4, !dbg !56, !tbaa !13
  %30 = icmp sge i32 %28, %29, !dbg !57
  %31 = zext i1 %30 to i32, !dbg !57
  call void @__VERIFIER_assert(i32 %31), !dbg !58
  br label %32, !dbg !59

32:                                               ; preds = %14, %1
  %33 = bitcast i32* %5 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #5, !dbg !60
  %34 = bitcast i32* %4 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %34) #5, !dbg !60
  %35 = bitcast i32* %3 to i8*, !dbg !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #5, !dbg !60
  ret void, !dbg !60
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare i32 @__VERIFIER_nondet_int(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @svp_simple_701_001_main() #0 !dbg !61 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !62
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !62
  %3 = call i32 (...) @__VERIFIER_nondet_int(), !dbg !63
  store i32 %3, i32* %1, align 4, !dbg !64, !tbaa !13
  %4 = load i32, i32* %1, align 4, !dbg !65, !tbaa !13
  %5 = icmp sgt i32 %4, -1000, !dbg !66
  br i1 %5, label %6, label %11, !dbg !65

6:                                                ; preds = %0
  store i32 11, i32* @i, align 4, !dbg !67, !tbaa !13
  %7 = load i32, i32* %1, align 4, !dbg !68, !tbaa !13
  store i32 %7, i32* @g, align 4, !dbg !69, !tbaa !13
  %8 = load i32, i32* %1, align 4, !dbg !70, !tbaa !13
  %9 = sub nsw i32 %8, 17, !dbg !71
  store i32 %9, i32* @h, align 4, !dbg !72, !tbaa !13
  %10 = load i32, i32* %1, align 4, !dbg !73, !tbaa !13
  store i32 %10, i32* @h, align 4, !dbg !74, !tbaa !13
  store i32 3, i32* @i, align 4, !dbg !75, !tbaa !13
  br label %11, !dbg !76

11:                                               ; preds = %6, %0
  %12 = bitcast i32* %1 to i8*, !dbg !77
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #5, !dbg !77
  ret i32 0, !dbg !78
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
!1 = !DIFile(filename: "svp_simple_701_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_701_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
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
!24 = distinct !DISubprogram(name: "svp_simple_701_001_isr_1", scope: !8, file: !8, line: 14, type: !9, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !15, i64 0}
!27 = !DILocation(line: 15, column: 3, scope: !24)
!28 = !DILocation(line: 15, column: 11, scope: !24)
!29 = !DILocation(line: 15, column: 7, scope: !24)
!30 = !DILocation(line: 16, column: 3, scope: !24)
!31 = !DILocation(line: 16, column: 11, scope: !24)
!32 = !DILocation(line: 16, column: 7, scope: !24)
!33 = !DILocation(line: 17, column: 3, scope: !24)
!34 = !DILocation(line: 17, column: 11, scope: !24)
!35 = !DILocation(line: 17, column: 7, scope: !24)
!36 = !DILocation(line: 18, column: 7, scope: !24)
!37 = !DILocation(line: 18, column: 9, scope: !24)
!38 = !DILocation(line: 19, column: 9, scope: !24)
!39 = !DILocation(line: 19, column: 7, scope: !24)
!40 = !DILocation(line: 20, column: 9, scope: !24)
!41 = !DILocation(line: 20, column: 7, scope: !24)
!42 = !DILocation(line: 21, column: 23, scope: !24)
!43 = !DILocation(line: 21, column: 28, scope: !24)
!44 = !DILocation(line: 21, column: 25, scope: !24)
!45 = !DILocation(line: 21, column: 5, scope: !24)
!46 = !DILocation(line: 23, column: 23, scope: !24)
!47 = !DILocation(line: 23, column: 28, scope: !24)
!48 = !DILocation(line: 23, column: 25, scope: !24)
!49 = !DILocation(line: 23, column: 5, scope: !24)
!50 = !DILocation(line: 25, column: 9, scope: !24)
!51 = !DILocation(line: 25, column: 11, scope: !24)
!52 = !DILocation(line: 25, column: 7, scope: !24)
!53 = !DILocation(line: 26, column: 9, scope: !24)
!54 = !DILocation(line: 26, column: 7, scope: !24)
!55 = !DILocation(line: 27, column: 23, scope: !24)
!56 = !DILocation(line: 27, column: 28, scope: !24)
!57 = !DILocation(line: 27, column: 25, scope: !24)
!58 = !DILocation(line: 27, column: 5, scope: !24)
!59 = !DILocation(line: 29, column: 3, scope: !24)
!60 = !DILocation(line: 31, column: 1, scope: !24)
!61 = distinct !DISubprogram(name: "svp_simple_701_001_main", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 34, column: 3, scope: !61)
!63 = !DILocation(line: 34, column: 11, scope: !61)
!64 = !DILocation(line: 34, column: 7, scope: !61)
!65 = !DILocation(line: 35, column: 7, scope: !61)
!66 = !DILocation(line: 35, column: 9, scope: !61)
!67 = !DILocation(line: 37, column: 7, scope: !61)
!68 = !DILocation(line: 38, column: 9, scope: !61)
!69 = !DILocation(line: 38, column: 7, scope: !61)
!70 = !DILocation(line: 39, column: 9, scope: !61)
!71 = !DILocation(line: 39, column: 11, scope: !61)
!72 = !DILocation(line: 39, column: 7, scope: !61)
!73 = !DILocation(line: 41, column: 9, scope: !61)
!74 = !DILocation(line: 41, column: 7, scope: !61)
!75 = !DILocation(line: 43, column: 7, scope: !61)
!76 = !DILocation(line: 45, column: 3, scope: !61)
!77 = !DILocation(line: 47, column: 1, scope: !61)
!78 = !DILocation(line: 46, column: 3, scope: !61)
