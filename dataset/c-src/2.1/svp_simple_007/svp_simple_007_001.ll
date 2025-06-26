; ModuleID = 'svp_simple_007_001.bc'
source_filename = "./svp_simple_007_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_007_001_global_var = global i32 0, align 4
@svp_simple_007_001_global_array = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_007_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %4 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !11
  %5 = bitcast i32* %2 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !11
  %6 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !12, !tbaa !13
  %7 = sext i32 %6 to i64, !dbg !17
  %8 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %7, !dbg !17
  store volatile i32 1, i32* %8, align 4, !dbg !18, !tbaa !13
  %9 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !19, !tbaa !13
  %10 = sext i32 %9 to i64, !dbg !20
  %11 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %10, !dbg !20
  %12 = load volatile i32, i32* %11, align 4, !dbg !20, !tbaa !13
  store i32 %12, i32* %2, align 4, !dbg !21, !tbaa !13
  %13 = bitcast i32* %3 to i8*, !dbg !22
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #3, !dbg !22
  %14 = call i32 (...) @rand(), !dbg !23
  store i32 %14, i32* %3, align 4, !dbg !24, !tbaa !13
  %15 = load i32, i32* %3, align 4, !dbg !25, !tbaa !13
  %16 = icmp eq i32 %15, 2, !dbg !26
  br i1 %16, label %17, label %21, !dbg !25

17:                                               ; preds = %0
  %18 = load i32, i32* %3, align 4, !dbg !27, !tbaa !13
  %19 = sext i32 %18 to i64, !dbg !28
  %20 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %19, !dbg !28
  store volatile i32 2, i32* %20, align 4, !dbg !29, !tbaa !13
  br label %25, !dbg !28

21:                                               ; preds = %0
  %22 = load i32, i32* %3, align 4, !dbg !30, !tbaa !13
  %23 = sext i32 %22 to i64, !dbg !31
  %24 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %23, !dbg !31
  store volatile i32 9, i32* %24, align 4, !dbg !32, !tbaa !13
  br label %25

25:                                               ; preds = %21, %17
  %26 = load volatile i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !33, !tbaa !13
  store i32 %26, i32* %1, align 4, !dbg !34, !tbaa !13
  %27 = bitcast i32* %3 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3, !dbg !35
  %28 = bitcast i32* %2 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3, !dbg !35
  %29 = bitcast i32* %1 to i8*, !dbg !35
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #3, !dbg !35
  ret void, !dbg !35
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare i32 @rand(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_007_001_isr_1() #0 !dbg !36 {
  call void (...) @idlerun(), !dbg !37
  store volatile i32 9, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 2), align 8, !dbg !38, !tbaa !13
  %1 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !39, !tbaa !13
  %2 = add nsw i32 %1, 1, !dbg !39
  store volatile i32 %2, i32* @svp_simple_007_001_global_var, align 4, !dbg !39, !tbaa !13
  %3 = load volatile i32, i32* @svp_simple_007_001_global_var, align 4, !dbg !40, !tbaa !13
  %4 = sext i32 %3 to i64, !dbg !41
  %5 = getelementptr inbounds [5 x i32], [5 x i32]* @svp_simple_007_001_global_array, i64 0, i64 %4, !dbg !41
  store volatile i32 9, i32* %5, align 4, !dbg !42, !tbaa !13
  ret void, !dbg !43
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_007_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_007")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_007_001_main", scope: !8, file: !8, line: 11, type: !9, scopeLine: 11, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_007_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_007")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 12, column: 3, scope: !7)
!11 = !DILocation(line: 13, column: 3, scope: !7)
!12 = !DILocation(line: 17, column: 35, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 17, column: 3, scope: !7)
!18 = !DILocation(line: 17, column: 66, scope: !7)
!19 = !DILocation(line: 19, column: 45, scope: !7)
!20 = !DILocation(line: 19, column: 13, scope: !7)
!21 = !DILocation(line: 19, column: 11, scope: !7)
!22 = !DILocation(line: 21, column: 3, scope: !7)
!23 = !DILocation(line: 21, column: 11, scope: !7)
!24 = !DILocation(line: 21, column: 7, scope: !7)
!25 = !DILocation(line: 22, column: 7, scope: !7)
!26 = !DILocation(line: 22, column: 9, scope: !7)
!27 = !DILocation(line: 23, column: 37, scope: !7)
!28 = !DILocation(line: 23, column: 5, scope: !7)
!29 = !DILocation(line: 23, column: 40, scope: !7)
!30 = !DILocation(line: 25, column: 37, scope: !7)
!31 = !DILocation(line: 25, column: 5, scope: !7)
!32 = !DILocation(line: 25, column: 40, scope: !7)
!33 = !DILocation(line: 27, column: 13, scope: !7)
!34 = !DILocation(line: 27, column: 11, scope: !7)
!35 = !DILocation(line: 28, column: 1, scope: !7)
!36 = distinct !DISubprogram(name: "svp_simple_007_001_isr_1", scope: !8, file: !8, line: 30, type: !9, scopeLine: 30, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 31, column: 3, scope: !36)
!38 = !DILocation(line: 32, column: 38, scope: !36)
!39 = !DILocation(line: 34, column: 33, scope: !36)
!40 = !DILocation(line: 35, column: 35, scope: !36)
!41 = !DILocation(line: 35, column: 3, scope: !36)
!42 = !DILocation(line: 35, column: 66, scope: !36)
!43 = !DILocation(line: 36, column: 1, scope: !36)
